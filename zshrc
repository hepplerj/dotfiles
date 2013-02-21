#    ____   _       ___           __ _
#   |_  /__| |_    / __|___ _ _  / _(_)__ _
#    / /(_-< ' \  | (__/ _ \ ' \|  _| / _` |
#   /___/__/_||_|  \___\___/_||_|_| |_\__, |
#                                      |___/

if [ "$TERM" = "xterm" ]; then
  if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
  else
    export TERM='xterm-color'
  fi
fi

[ -z "$PS1" ] && return

. ~/.dotfiles/zsh/completion.zsh
. ~/.dotfiles/zsh/prompt.zsh

[ -e  ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

if [ -e  ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Pull in bash functions and aliases to avoid repetation
source "/Users/jheppler/.dotfiles/bash/functions"
source "/Users/jheppler/.dotfiles/bash/aliases"

# Don't end with errors.
true