# Project aliases
# -------------------------------------------------------------------
alias runwiki='cd ~/Dropbox/research/dissertation/wiki && gitit -f my.conf'
alias research='cd ~/Dropbox/research/dissertation'
alias wiki='cd ~/Dropbox/research/dissertation/wiki'

# Navigation
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."

# File and system management
# -------------------------------------------------------------------
alias ack="ack-grep"
alias atsp="~/Projects/ATSP/ATS\ -\ History/"
alias c='clear'
alias chromeproof="open -a Google\ Chrome --args -incognito"
alias cp='cp -i'
alias cpu='top -a -o cpu -n 10'
alias cpwd='pwd|tr -d "\n"|pbcopy'  # copy the working directory path
alias duh='du -hs * | sort -h -r'  # Sort files/dirs by size
alias f='open -a Finder ./'
alias findd="find . -type d -iname" # find a directory
alias findf="find . -type f -iname" # find a file
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user' 
alias grep='grep --color=auto'
alias h='history'
alias home='cd && clear'
alias ip="curl icanhazip.com"       # get current public IP
alias mem='top -o rsize -n 10' #memory
alias md='perl /Users/jheppler/bin/Markdown_1.0.1/Markdown.pl'
alias more='more -R'                # give more colors
alias mutt='cd ~/Desktop && mutt'
alias process="ps aux | grep"
alias servethis="python -m SimpleHTTPServer"
alias src='source ~/.zshrc'
alias update="sudo softwareupdate -i -a; brew update; brew upgrade"

# Servers
# -------------------------------------------------------------------
alias stanford='ssh jheppler@cardinal.stanford.edu'
alias jason='ssh jasonhep@jasonheppler.org'

# Gists
# -------------------------------------------------------------------
alias pastegist="jist -Ppo"  # paste copy of clipboard to public Gist
alias jist="jist -o"         # always open the Gist in the browser
