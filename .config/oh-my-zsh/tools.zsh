# yazi
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"

# fastfetch in new tmux window
if command -v fastfetch &> /dev/null; then 
    if [[ -z "$NVIM" ]] && [[ -n "$TMUX" ]] && [[ "$(tmux display-message -p '#P')" == 1 ]]; then
        fastfetch 
    fi
fi

# bun completions
[ -s "/Users/nishant/.bun/_bun" ] && source "/Users/nishant/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/Users/nishant/.opencode/bin:$PATH

# Antigravity
export PATH="/Users/nishant/.antigravity/antigravity/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/nishant/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# aa: workmux dashboard on the left, a coordinator Claude session on the right.
aa() {
  if [[ -z $TMUX ]]; then
    echo "aa: run inside tmux" >&2
    return 1
  fi
  command tmux rename-window -t "$TMUX_PANE" coordinator
  local right
  right=$(command tmux split-window -h -t "$TMUX_PANE" -c "$PWD" -P -F '#{pane_id}')
  command tmux send-keys -t "$right" "claude /coordinator" Enter
  workmux dashboard
}