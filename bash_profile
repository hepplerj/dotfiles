## ========== Running tests ==========
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
## ===================================

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/texbin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export EDITOR="vim"
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LESSCHARSET=utf-8

# Bash prompt
fmt_time () { #format time just the way I like it
  if [ `date +%p` = "PM" ]; then
    meridiem="pm"
  else
    meridiem="am"
  fi
  date +"%l:%M:%S$meridiem"|sed 's/ //g'
}

pwdtail () { #returns the last 2 fields of the working directory
  pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

prompt_command () {
  if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
      BRANCH="\$(__git_ps1 '[ %s ] ')"
  fi
  local TIME=`fmt_time`
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  local BLACK="\[\033[0;30m\]"
  local DEFAULT="\[\033[0;39m\]"
  local TITLEBAR='\[\e]2;`pwdtail`\a'
  #export PS1="\[${TITLEBAR}\][ ${CYAN}\u${WHITE} ]\w\n${RED}${BRANCH}${DEFAULT}${GREEN}$ ${WHITE}"
}

PROMPT_COMMAND=prompt_command;

# trying out something simpler, see how I like it
#export PS1="\w $ "
PS1="[ \w ] $ "

# Colors
export CLICOLOR=1
export LSCOLORS=cxFxCxDxBxegedabagacad

# History handling
export HISTCONTROL=erasedups # erase duplicates
export HISTSIZE=1000 # resize history size

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bp='mate ~/.bash_profile'
alias c='clear'
alias cd.='cd ..'
#alias cp='cp -i'
alias cpu='top -o cpu -n 10'
alias chromeproof="open -a Google\ Chrome --args -incognito"
alias df="df -h"
alias f='open -a Finder ./'
alias ff='ruby /Users/hepplerj/src/editscript.rb'
alias fireproof="/Applications/Firefox.app/Contents/MacOS/firefox -safe-mode"
alias gp='git push origin master'
alias gpa='git push --all'
alias grep='grep --color=auto'
alias h='history'
alias home='cd && clear'
#alias la='ls -Al' # show hidden files
alias l='ls -Gl'
alias la='ls -aF'
alias ld='ls -ld'
alias lg='ls -AlG'
alias ls='ls -F'
alias ll='ls -l'
#alias lm='ls -al | more' # pipe through 'more'¬
alias lt='echo "-----Newest--" && ls -Atl && echo "-----Oldest--"'
alias newproject='ruby ~/src/newproject.rb'
alias mvim='open -a /Applications/MacVim.app'
alias mem='top -o rsize -n 10' #memory
alias md='perl Users/hepplerj/Projects/Markdown_1.0.1/Markdown.pl'
alias mutt='cd ~/Desktop && mutt'
#alias mv='mv -i'
alias o='open -a'
alias otask='ruby ~/src/otask/bin/otask'
#alias rm='rm -i'
alias rtt='/Users/hepplerj/Projects/Read2Text/read2text'
alias smartypants='perl /Users/hepplerj/src/SmartyPants.pl'
alias src="source ~/.bash_profile"
alias subl='sublime'
alias t='todo.sh -d /Users/hepplerj/Projects/todocli/todo.cfg' # Gina Trapani's todo.txt
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'
alias vrc='vim ~/.vimrc'

# Servers aliases
alias segonku='ssh jheppler@segonku.unl.edu'
alias jetson='ssh jheppler@jetson.unl.edu'
alias spacely='ssh jheppler@spacely.unl.edu'
alias jason='ssh jasonhep@jasonheppler.org'

# markdownify
# thanks to Brett Terpstra
urlenc () { #url encode the passed string
  echo -n "$1" | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'
}
 
hymd () { # copy raw markdown to clipboard
  encurl=$(urlenc $1)
  curl "http://heckyesmarkdown.com/go/?read=1&preview=0&showframe=0&u=$encurl"|pbcopy
  echo "In your clipboard, man."
}
 
function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}

# Edit markdown files in writing directory
edmd () {
	WRITINGDIR="/Users/hepplerj/Dropbox/writing"
	EDITCMD="subl"
	filelist=$(mdfind -onlyin "$WRITINGDIR" "($@) AND kind:markdown")
	listlength=$(mdfind -onlyin "$WRITINGDIR" -count "($@) AND kind:markdown")
	if [[ $listlength > 0 ]]; then
		if [[ $listlength == 1 ]]; then
			$EDITCMD $filelist
		else
			IFS=$'\n'
			PS3='Edit which file? (1 to cancel): '
			select OPT in "Cancel" $filelist; do
				if [ $OPT != "Cancel" ]; then
					$EDITCMD $OPT
				fi
				break
			done
		fi
	else
		return 1
	fi
	return 0
}

extract () { #unarchive various compression formats based on extension
        if [ -f $1 ] ; then
                case $1 in
                        *.tar.bz2)          tar xjf $1       ;;
                        *.tar.gz)           tar xzf $1       ;;
                        *.bz2)              bunzip2 $1       ;;
                        *.rar)              rar x $1         ;;
                        *.gz)               gunzip $1        ;;
                        *.tar)              tar xf $1        ;;
                        *.tbz2)             tar xjf $1       ;;
                        *.tgz)              tar xzf $1       ;;
                        *.zip)              unzip $1         ;;
                        *.Z)                uncompress $1    ;;
                        *.dmg)              hdiutil mount $1 ;;
                        *)                  echo "'$1' cannot be extracted via extract()" ;;
                esac
        else
                echo "'$1' is not a valid file"
        fi
}

# wrapper for git to log commits to an nvALT note
# just an overall reminder of what I did all night
# via Brett Terpstra
function ca(){
  note="/Users/hepplerj/Dropbox/notes/universalgitlog.txt"
  msg=$*
  path=$(pwd)
  before=$(cat "$note")
  echo "$(date '+%y-%m-%d %H:%M | ') (${path##*/}) $msg" > "$note"
  echo "$before" >> "$note"
  git commit -am "$msg"
}

tman () { # open man page in TextMate
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}

sman () { # open man page in Sublime
  MANWIDTH=160 MANPAGER='col -bx' man $@ | sublime
}

# Gitlogger
# For use with gitlogger.sh
function glog () {
	echo "$1:`pwd`" >> ~/.gitlogger
  echo "Done!"
}

# Bigger scripts seaprated out

[[ -s "/Users/hepplerj/src/scripts/na.sh" ]] && source "/Users/hepplerj/src/scripts/na.sh"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
