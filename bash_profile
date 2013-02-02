# Test for interactive shell
if [[ $- != *i* ]]; then
  # Shell is non-interactive. Be done!
  return
fi

# Load bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Load bash_completion if exists
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Load git_completion if exists
if [ -f ~/.git_completion.sh ]; then
  source ~/.git_completion.sh
fi

# Load the shell dotfiles
for file in ~/github/dotfiles/{bash_prompt,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/texbin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Colors
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Bigger scripts seaprated out

[[ -s "/Users/hepplerj/src/scripts/na.sh" ]] && source "/Users/hepplerj/src/scripts/na.sh"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
