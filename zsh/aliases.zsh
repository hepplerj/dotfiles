# Projects
# -------------------------------------------------------------------
alias blog='mvim -S ~/Dropbox/acad/hepplerj.github.com/source/_drafts/*.md'
alias book='mvim -S ~/Dropbox/machinesvalley/Session.vim'
alias dot='mvim -S ~/Dropbox/dev/dotfiles/Session.vim'
alias notebook='mvim -S ~/Dropbox/acad/wiki/wikidata/Session.vim'

# Unix
# -------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
function cs() { cd "$@" && ls; }
alias edit='mvim'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias l='exa'
alias ls='exa'
alias ll='exa -al'
alias lh='exa -Alh'
alias c='clear'
alias home='cd && clear'
alias cpu='top -a -o cpu -n 10'
alias cp='cp -i'
alias f='open -a Finder ./' # open current dir in Finder
alias grep='grep --color=auto'
alias mvim='open -a MacVim'
alias mem='top -o rsize -n 10'
alias more='more -R'
alias mutt='cd ~/Desktop && mutt'
alias process="ps aux | grep -i"
alias scanlocal='nmap -sP 192.168.1.0/24'
alias servedir='http-server -p 8008'
alias serve='open http://localhost:8000 && http-server -p 8000'
alias reload='exec $SHELL -l'
alias tmux='tmux -u'
alias whatsnew='whatsnew()'
alias vim='nvim'

# File and system management
# -------------------------------------------------------------------
alias atsp="cd ~/Dropbox/work/ATSP/ATS\ -\ History/"
alias brewup='brew update && brew upgrade'
alias dirsize="du -sx ./* 2>/dev/null | sort -n"
alias ducks='du -cks ~/**/* | sort -rn | head -n 20'
alias duh='du -hs * | sort -h -r'  # Sort files/dirs by size
alias findd="find . -type d -iname" # find a directory
alias findf="find . -type f -iname" # find a file
alias ip="curl icanhazip.com"       # get current public IP
alias process="ps aux | grep"
alias runwiki='cd ~/Dropbox/acad/wiki && gitit -f my.conf > /dev/null 2>&1 &'
alias zshreload='source ~/.zshrc'

# R
# -------------------------------------------------------------------
shiny() {
    if [ -z "$1" ]
    then
      Rscript -e "shiny::runApp(port = 3838)"
    else
      Rscript -e "shiny::runApp(port = $1)"
    fi
}

# Attach a tmux session if it exists; otherwise start a new one
tm() { tmux attach-session -t $1 || tmux new-session -s $1 }

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

# Git 
# -------------------------------------------------------------------
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gwd='git diff --word-diff'
alias gi="echo $1 >> .gitignore"
alias gl='git pull --prune'
alias glast='git diff HEAD^ HEAD' # diff of last commit
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# Collect my vim usage for _something_…
# http://www.patrick-wied.at/projects/heatmap-keyboard/
if command -v nvim &> /dev/null; then
    alias vim="nvim -w ~/.vim_keystrokes"
else
    alias vim="vim -w ~/.vim_keystrokes"
fi
