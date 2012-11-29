export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="myzsh"
plugins=(command-coloring pip fabric lein redis-cli vagrant)

source $ZSH/oh-my-zsh.sh

# Custom options --------------------------------------------------------------
unsetopt promptcr

# Useful aliases --------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c="clear"
alias chromeproof="open -a Google\ Chrome --args -incognito"
alias home='cd && clear'
alias f="open -a Finder ./"
alias mvim='open -a /Applications/MacVim.app'
alias mutt='cd ~/Desktop && mutt'
alias rake="noglob rake"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias src="source ~/.zshrc"
alias o='open -a'
alias otask='ruby ~/src/otask/bin/otask'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'
alias zshconfig="vim ~/.zshrc"

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
export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:
export PATH=$PATH:/usr/local/sbin
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
source /usr/local/bin/virtualenvwrapper.sh

# Python variables ------------------------------------------------------------
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

# Server stuff ----------------------------------------------------------------
alias spacely="ssh jheppler@spacely.unl.edu"
alias segonku="ssh jheppler@segonku.unl.edu"
alias jetson="ssh jheppler@jetson.unl.edu"

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
  before=$(`cat` "$note")
  echo "$(`date` '+%y-%m-%d %H:%M | ') (${path##*/}) $msg" > "$note"
  echo "$before" >> "$note"
  `git commit -am "$msg"`
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

function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}

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

tman () { # open man page in TextMate
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}

# Bigger scripts seaprated out

[[ -s "/Users/hepplerj/src/scripts/na.sh" ]] && source "/Users/hepplerj/src/scripts/na.sh"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"





# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git pip django python brew)

#source $ZSH/oh-my-zsh.sh
#unsetopt correct_all

# Terminal 256 colors
export TERM="xterm-256color"
export PYTHONDONTWRITEBYTECODE=1
