ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mine"
plugins=(osx git ruby command-coloring pip)

export EDITOR='vim'
export DISABLE_AUTO_TITLE="true"
export RUBYOPT=rubygems
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/bash/aliases
source $HOME/.dotfiles/bash/functions
source $HOME/git/se-aliases/se-aliases.sh
