# yazi
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

# uv env
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# fastfetch in new tmux window
if command -v fastfetch &> /dev/null; then 
    if [[ -z "$NVIM" ]] && [[ -n "$TMUX" ]] && [[ "$(tmux display-message -p '#P')" == 1 ]]; then
        fastfetch 
    fi
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# aa [claude|pi]: workmux dashboard on the left, a coordinator session on the right.
# Without an argument the agent is $WM_AGENT, else Omarchy's default agent, else claude.
aa() {
  local agent start
  agent=${1:-$(wm-agent default)} || return 1
  case $agent in
    claude) start="claude /coordinator" ;;
    pi) start="pi /skill:coordinator" ;;
    *)
      echo "aa: unknown agent '$agent' (want claude or pi)" >&2
      return 1
      ;;
  esac
  if [[ -z $TMUX ]]; then
    echo "aa: run inside tmux" >&2
    return 1
  fi
  command tmux rename-window -t "$TMUX_PANE" coordinator
  local right
  right=$(command tmux split-window -h -t "$TMUX_PANE" -c "$PWD" -P -F '#{pane_id}')
  command tmux send-keys -t "$right" "$start" Enter
  workmux dashboard
}