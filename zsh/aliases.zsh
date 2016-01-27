# Projects
# -------------------------------------------------------------------
alias blog='mvim -S ~/Dropbox/acad/hepplerj.github.com/Session.vim'
alias diss='mvim -S ~/Dropbox/dissertation/Session.vim'

#alias vim='vim -w ~/.vimlog "$@"'
#alias mvim='mvim -w ~/.vimlog "$@"'
alias vim='/usr/local/bin/vim'

# Unix
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
function cs() { cd "$@" && ls; }
alias edit='atom'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'
alias c='clear'
alias home='cd && clear'
alias cpu='top -a -o cpu -n 10'
alias cp='cp -i'
alias f='open -a Finder ./'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user' 
alias grep='grep --color=auto'
alias mem='top -o rsize -n 10'
alias mutt='cd ~/Desktop && mutt'
alias servethis='http-server -p 8008'
alias src='source ~/.zshrc'
alias reload='exec $SHELL -l'
alias tmux='tmux -u'
alias update="sudo softwareupdate -i -a; brew update; brew upgrade"

# File and system management
# -------------------------------------------------------------------
alias atsp="cd ~/Dropbox/work/ATSP/ATS\ -\ History/"
alias brewup='brew update && brew upgrade'
alias cesta="~/Dropbox/work/ATSP/ATS\ -\ CESTA/"
alias ducks='du -cks ~/**/* | sort -rn | head -n 20'
alias duh='du -hs * | sort -h -r'  # Sort files/dirs by size
alias findd="find . -type d -iname" # find a directory
alias findf="find . -type f -iname" # find a file
alias ip="curl icanhazip.com"       # get current public IP
alias process="ps aux | grep"
alias runwiki='cd ~/Dropbox/acad/wiki && gitit -f my.conf > /dev/null 2>&1 &'
alias research='cd ~/Dropbox/acad/wiki/wikidata/'
alias todo='mvim ~/Dropbox/acad/wiki/wikidata/TODO.page -c "BG"'
alias wiki='cd ~/Dropbox/acad/wiki'
alias zshreload='source ~/.zshrc'

# PostgreSQL
# -------------------------------------------------------------------
alias start_pg='pg_ctl -D /usr/local/var/postgres/9.2/main start -l /usr/local/var/postgres/9.2/main/server.log'
alias stop_pg='pg_ctl -D /usr/local/var/postgres/9.2/main stop -s -m fast'

# Usage: compresspdf [input file] [output file] 
# [screen*|ebook|printer|prepress]
compresspdf() {
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile=$2 $1
}
