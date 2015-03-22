# Projects
# -------------------------------------------------------------------
alias blog='mvim -S ~/acad/hepplerj.github.com'
alias diss='cd ~/acad/dissertation'

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
alias atsp="~/work/ATSP/ATS\ -\ History/"
alias cesta="~/work/ATSP/ATS\ -\ CESTA/"
alias process="ps aux | grep"
alias runwiki='cd ~/acad/wiki && gitit -f my.conf > /dev/null 2>&1 &'
alias research='cd ~/acad/wiki/wikidata/'
alias todo='mvim ~/acad/wiki/wikidata/TODO.page -c "BG"'
alias wiki='cd ~/acad/wiki'

# PostgreSQL
# -------------------------------------------------------------------
alias start_pg='pg_ctl -D /usr/local/var/postgres/9.2/main start -l /usr/local/var/postgres/9.2/main/server.log'
alias stop_pg='pg_ctl -D /usr/local/var/postgres/9.2/main stop -s -m fast'

# Usage: compresspdf [input file] [output file] 
# [screen*|ebook|printer|prepress]
compresspdf() {
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile=$2 $1
}
