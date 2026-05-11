alias forgor='bat ~/.oh-my-zsh/custom/aliases.zsh'

# Directory navigation
alias c='clear'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias -- -='cd -'

alias l='ls -CF'
alias ls='ls --color=always'
alias ll='ls -alF'
alias lh='ls -Alh'
alias lf='ls -a | grep'
alias lt='ls -ltr'
alias la='ls -A'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias p="pushd"
alias pd="popd"

# Files
alias cp='cp -i'
alias mv='mv -i'
alias open='gio open'
alias mkdir='mkdir -p'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

# Terminal
alias h='history'
alias hg='history | grep'
alias ping='ping -c 5'

# Vim
# alias vim='nvim'
# alias vi='nvim'

# Date
alias today='date +"%Y.%m.%d"'
alias yday='date --date="yesterday" +"%Y.%m.%d"'

# Docker
function dcs-fn {
	docker-compose stop $1
}

alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcs=dcs-fn

alias ld="lazydocker"
alias lg="lazygit"
alias ly="yadm enter lazygit"

# Git
alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gs='git status'
alias gss='git status -s'

alias gb='git branch'
alias gco='git checkout'
alias gch='git checkout -b'

alias gc='git commit'
alias gcm='git commit -m'

alias gd='git diff'

alias gl='git log'
alias glg='git lg'

alias gpl='git pull'
alias gps='git push'
