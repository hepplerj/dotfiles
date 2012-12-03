export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="myzsh"
plugins=(command-coloring pip fabric lein redis-cli vagrant)

source $ZSH/oh-my-zsh.sh

# Custom options --------------------------------------------------------------
unsetopt promptcr

# Aliases and Functions
. ~/.shell/aliases
. ~/.shell/functions
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

export DISABLE_AUTO_TITLE="true"

# Environment variables -------------------------------------------------------
export EDITOR="vim"
export PATH="$HOME/.gem/ruby/1.8/bin:${PATH}"
export PATH="$HOME/bin:${PATH}"
export PATH="$HOME/lib/dotfiles/bin:${PATH}"
export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups
export RUBYOPT=rubygems
#export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:
export PATH=$PATH:/usr/local/sbin
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
source /usr/local/bin/virtualenvwrapper.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/texbin:/.cabal/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/.cabal/bin

# Python variables ------------------------------------------------------------
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

# Server stuff ----------------------------------------------------------------
alias spacely="ssh jheppler@spacely.unl.edu"
alias segonku="ssh jheppler@segonku.unl.edu"
alias jetson="ssh jheppler@jetson.unl.edu"

# Bigger scripts seaprated out

[[ -s "/Users/hepplerj/src/scripts/na.sh" ]] && source "/Users/hepplerj/src/scripts/na.sh"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Terminal 256 colors
export TERM="xterm-256color"
export PYTHONDONTWRITEBYTECODE=1
