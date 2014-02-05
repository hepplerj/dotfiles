# Unix
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
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
alias servethis='ruby -run -e httpd . -p 8888'
alias src='source ~/.zshrc'
alias update="sudo softwareupdate -i -a; brew update; brew upgrade"

# Nav
# -------------------------------------------------------------------
alias atsp="~/Projects/ATSP/ATS\ -\ History/"
alias runwiki='cd ~/acad/research/dissertation/wiki && gitit -f my.conf'
alias research='cd ~/acad/research/dissertation'
alias wiki='cd ~/acad/research/dissertation/wiki'

# PostgreSQL
# -------------------------------------------------------------------
alias start_pg='pg_ctl -D /usr/local/var/postgres/9.2/main start -l /usr/local/var/postgres/9.2/main/server.log'
alias stop_pg='pg_ctl -D /usr/local/var/postgres/9.2/main stop -s -m fast'
