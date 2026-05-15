# full color
export TERM=tmux-256color

# dircolors
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Editor
export EDITOR=nvim

# jk as Esc
jk-to-vi-cmd(){
  zle vi-cmd-mode
}
zle -N jk-to-vi-cmd
bindkey -M viins 'jk' jk-to-vi-cmd

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
