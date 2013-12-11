#!/bin/zsh
 
CURRENT_DIR=${PWD##*/}
 
FILENAME=$1
FILEPATH=$2
 
# Get filename if inside vim
file() {
  if [[ $FILENAME == "" ]]; then
    echo ""
  else
    if [[ $FILEPATH == "." ]]; then
      echo "#[default]#[fg=cyan]$FILENAME"
    else
      echo "$FILEPATH/#[default]#[fg=cyan]$FILENAME"
    fi
  fi
}
 
# Get the current git repo branch
branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}
 
# Get whether branch needs to be synced.
sync () {
  unpushed=$(git cherry -v @{upstream} 2>/dev/null)
  if [[ $unpushed == "" ]]; then
    echo ""
  else
    echo "⟳#[default]"
  fi
}
 
# Display git information
git() {
  st=$(git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]; then
    echo ""
  else
    if [[ $st == "nothing to commit, working directory clean" ]]; then
      echo " #[fg=cyan]on #[fg=white,bold]$(branch)$(sync)"
    else
      echo " #[fg=cyan]on #[fg=black,bold]$(branch)$(sync)"
    fi
  fi
}
 
# Set tmux statusbar (remind me to refactor this)
# if the CWD begins with '/' ie. outside the CWD
if [[ `echo $FILEPATH | cut -c1` == '/' ]]; then
  # Set environment variable for retrieval later when switching windows.
  tmux setenv TMUX_STATUS_$(tmux display -p "#I") " #[fg=cyan,bold]$(file)#[default]"
  # Set tmux status line itself.
  tmux set -q status-left " #[fg=cyan,bold]$(file)#[default]"
else
  # Set environment variable for retrieval later when switching windows.
  tmux setenv TMUX_STATUS_$(tmux display -p "#I") " #[fg=cyan,bold]$CURRENT_DIR/$(file)#[default]$(git)"
  # Set tmux status line itself.  
  tmux set -q status-left " #[fg=cyan,bold]$CURRENT_DIR/$(file)#[default]$(git)"
fi