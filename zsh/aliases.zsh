# Editors and languages
# -------------------------------------------------------------------
alias vim='nvim'
alias R="R --no-save --no-restore-data --quiet"

# System management
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias chnm="~/Dropbox/30-39 Projects/30.06 CHNM"
alias home="cd && clear"
alias findd="find . -type d -iname" # find a directory
alias findf="find . -type f -iname" # find a file 
alias ip="curl icanhazip.com"       # get current public IP
alias ls="exa"
alias more='more -R'                # give more colors
alias process="ps aux | grep -i"
alias scanlocal='nmap -sP 192.168.1.0/24'
alias servethis='python3 -m http.server'
alias dfd='df -h -x squashfs -x tmpfs -x devtmpfs'
alias runwiki='cd ~/Dropbox/acad/wiki && gitit -f my.conf > /dev/null 2>&1 &'

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

# Helper functions 
# -------------------------------------------------------------------

# Check for updates
whatsnew() {
  echo "Checking homebrew packages..."
  brew update > /dev/null;
  new_packages=$(brew outdated --quiet)
  num_packages=$(echo $new_packages | wc -w)

  if [ $num_packages -gt 0 ]; then
    echo "New package updates available:"
    for package in $new_packages; do 
      echo "  * $package";
    done
  else
    echo "No new package updates available."
  fi
}
