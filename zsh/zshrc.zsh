# ZSH configuration

# Environment variables
if [[ -a "$HOME/.env.zsh" ]]; then
  source "$HOME/.env.zsh"
fi
export EDITOR='vim'
export PROJECTS=$HOME/github # c + <tab> for autocomplete
export ZSH=$HOME/.dotfiles
export GOPATH=$HOME/go
if [[ -v NUMCORES ]]; then
  export MAKEFLAGS="-j $NUMCORES"
else
  export MAKEFLAGS="-j 4"
fi
export HOMEBREW_NO_ANALYTICS=1

# Aliases
source $ZSH/zsh/aliases.zsh

# Functions
fpath=($ZSH/zsh/functions /usr/local/share/zsh-completions $fpath)
autoload -U $ZSH/zsh/functions/*(:t)

# Options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
export CLICOLOR=true
export TERM="xterm-256color"
setopt NO_BG_NICE # don't nice background tasks
setopt NO_LIST_BEEP
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt AUTOPUSHD        # keep history of directories
setopt AUTO_LIST        # list ambiguous completions automatically
setopt complete_aliases
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
# Vim key bindings and Vim-like line editor
bindkey -v
autoload -U   edit-command-line
zle -N        edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
unsetopt nomatch
autoload colors zsh/terminfo && colors

# enables color in ls
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# Prompt
# -------------------------------------------------------------------
git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      echo ":%{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo ":%{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info() {
  ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
  # echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
  echo ":%{$fg[magenta]%}${ref#refs/heads/}${reset_color%}"
}

unpushed() {
  /usr/bin/git cherry -v @{upstream} 2>/dev/null
}

need_push() {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo ":%{$fg[magenta]%}unpushed%{$reset_color%}"
  fi
}

has_stash() {
  if [[ -n "$(git stash list 2>/dev/null)" ]]; then
    echo ":%{$fg[magenta]%}stash%{$reset_color%}"
  fi
}

directory_name(){
  echo "%{$fg[blue]%}%~%{$reset_color%}"
}

user_machine(){
  echo "%{$fg[yellow]%}%n@%m%{$reset_color%}"
}

python_venv() {
   if [[ -z $VIRTUAL_ENV ]] then
     echo ""
   else
     echo ":%{$fg[green]%}venv$reset_color%}"
   fi
}

set_prompt() {
  export PROMPT=$'\n$(user_machine):$(directory_name)$(git_prompt_info)\n%{$fg[red]%}›%{$reset_color%} '
  RPROMPT='%(?.. %?)'
}

# Set the correct prompt
#precmd() {
#  set_prompt
#  print -Pn "\e]0;%~\a"
#}

# Change the PROMPT style to something like | (base) hades in ~ >
export PROMPT='%F{8}[%f%F{37}%n%f%F{8}]%f %F{8}% ~ %f$(git_branch) %F{13}>%f '
setopt promptsubst

# Path
# -------------------------------------------------------------------
pathdirs=(
  /snap/bin
  /usr/local/opt/ruby/bin
  $HOME/.dotfiles/bin
)

for dir in $pathdirs; do
  if [ -d $dir ]; then
    PATH=$dir:$PATH
  fi
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit
