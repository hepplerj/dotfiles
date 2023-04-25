# Editors and languages
# -------------------------------------------------------------------
alias vim='nvim'
alias R="R --no-save --no-restore-data --quiet"

# System management
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias chnm="cd ~/Dropbox/30-39\ Projects/30.06\ CHNM"
alias home="cd && clear"
alias findd="find . -type d -iname" # find a directory
alias findf="find . -type f -iname" # find a file 
alias ip="curl icanhazip.com"       # get current public IP
alias ls="exa"
alias more='more -R'                # give more colors
alias process="ps aux | grep -i"
alias servethis="python3 -m http.server"
alias writingdir="cd ~/Documents/Research/80.\ Writing"

# Django 
# -------------------------------------------------------------------
alias pm="python3 manage.py"
alias pmm="python3 manage.py migrate"
alias prs="python3 manage.py runserver"

# Git 
# -------------------------------------------------------------------
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'
alias gl='git pull --ff-only'

# Conda activation shortcuts
# -------------------------------------------------------------------
alias clocal="conda activate local"
alias cbase="conda activate base"
