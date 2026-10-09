#!/bin/sh
# One Claude per worktree, in a hidden session that several clients attach to:
# the workmux window's Claude page and nvim's Claude split.
#   wm-claude.sh page [claude args]    pane command in workmux windows
#   wm-claude.sh attach [claude args]  nvim's claudecode terminal_cmd
mode=$1
shift

top=$(git rev-parse --show-toplevel 2>/dev/null || pwd -P)
# The main repo, wherever worktree_dir puts the trees; repo and tree both
# name the session, so one branch name in two repos gets two sessions.
main=$(dirname "$(git -C "$top" rev-parse --path-format=absolute --git-common-dir 2>/dev/null || echo "$top/.git")")
name=$(printf 'wmc_%s_%s' "$(basename "$main")" "$(basename "$top")" | tr -c 'A-Za-z0-9_-' '_')

if [ "$mode" = page ]; then
  tmux set -p -t "$TMUX_PANE" @claude 1
  page=$TMUX_PANE
else
  page=$(tmux list-panes -t "$TMUX_PANE" -F '#{pane_id} #{@claude}' | awk '$2 == 1 { print $1 }')
fi

if ! tmux has-session -t "=$name" 2>/dev/null; then
  # Claude checks a worktree's trust against its main repo, so trust that
  # once; only from a linked worktree, never for an arbitrary directory.
  cfg=$HOME/.claude.json
  if [ "$main" != "$top" ] && [ -f "$cfg" ] &&
    ! jq -e --arg d "$main" '.projects[$d].hasTrustDialogAccepted == true' "$cfg" >/dev/null; then
    tmp=$(mktemp "$cfg.XXXXXX") &&
      jq --arg d "$main" '.projects[$d].hasTrustDialogAccepted = true' "$cfg" >"$tmp" &&
      mv "$tmp" "$cfg"
  fi

  # Reopening a worktree picks its conversation back up.
  key=$(printf %s "$top" | tr -c 'A-Za-z0-9' '-')
  if [ $# -eq 0 ] && ls "$HOME/.claude/projects/$key/"*.jsonl >/dev/null 2>&1; then
    set -- --continue
  fi

  # workmux's hooks act on $TMUX_PANE, which tmux resets inside the session;
  # pointing it at the page puts the status on the worktree's own window.
  tmux new-session -d -s "$name" -c "$top" env TMUX_PANE="${page:-}" claude --ide "$@"
  tmux set -t "$name" status off
fi

# Gone with the last client, so closing the workmux window ends this Claude.
# Set once attached: an unattached session would be destroyed on the spot.
TMUX= exec tmux attach -t "=$name" \; set destroy-unattached on
