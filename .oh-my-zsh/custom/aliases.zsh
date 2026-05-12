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
alias ping='ping -c 5'

# Vim
# alias vim='nvim'
# alias vi='nvim'

# Date
alias today='date +"%Y.%m.%d"'
alias yday='date --date="yesterday" +"%Y.%m.%d"'

# TUI
alias ld="lazydocker"
alias lg="lazygit"
alias ly="yadm enter lazygit"

# yadm
alias y='yadm'
alias ya='yadm add'
alias yst='yadm status'
alias yc='yadm commit'
alias yd='yadm diff'
alias ylgg='yadm log --graph'
alias ylg='yadm log --stat'
alias yl='yadm pull'
alias yp='yadm push'