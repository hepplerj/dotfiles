prompt_igloo_setup() {
  # +------------------------------+
  # + ZSH Options & Configurations +
  # +------------------------------+
  # Enable command substitution and arithmetic expansion in prompts.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  setopt LOCAL_OPTIONS PROMPT_SUBST

  # Enable support for color name mapping to (and from) the ANSI standard eight-color terminal codes.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Descriptions
  autoload -Uz colors && colors

  # Allow to add functions to ZSH's hook functions.
  # Added this function in order to always run it when the prompt gets rendered to update included data.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Manipulating-Hook-Functions
  #   2. http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_igloo_setup

  # +------------------------+
  # + Git Prompt Integration +
  # +------------------------+
  # The following variables are options to configure Git's prompt support script.
  # See:
  #   1. https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

  # Show more information about the identity of commits checked out as a detached HEAD.
  # Control the behavior by setting one of these values:
  #   contains  Relative to newer annotated tag (v1.6.3.2~35)
  #   branch    Relative to newer tag or branch (master~4)
  #   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
  #   tag       Relative to any older tag (v1.6.3.1-13-gdd42c2f)
  #   default   Exactly matching tag
  GIT_PS1_DESCRIBE_STYLE=${GIT_PS1_DESCRIBE_STYLE:-describe}

  # Disable `__git_ps1` output when the current working directory is set up to be ignored by Git.
  # Also configurable per repository via `git config bash.hideIfPwdIgnored`.

  GIT_PS1_HIDE_IF_PWD_IGNORED=${GIT_PS1_HIDE_IF_PWD_IGNORED:-}
  # Show colored hints about the current dirty state.
  # The colors are based on the colored output of `git status -sb`.
  # NOTE: Only available when using `__git_ps1` via ZSH's `precmd` hook function!
  GIT_PS1_SHOWCOLORHINTS=${GIT_PS1_SHOWCOLORHINTS:-}

  # Show unstaged (*) and staged (+) changes.
  # Also configurable per repository via `git config bash.showDirtyState`.
  GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-true}

  # Show currently stashed ($) changes.
  GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-true}

  # Show untracked (%) changes.
  # Also configurable per repository via `git config bash.showUntrackedFiles`.
  GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-true}

  # Show indicators for difference between HEAD and its upstream.
  #
  # <  Behind upstream
  # >  Ahead upstream
  # <> Diverged upstream
  # =  Equal upstream
  #
  # Control behavior by setting to a space-separated list of values:
  #   auto     Automatically show indicators
  #   verbose  Show number of commits ahead/behind (+/-) upstream
  #   name     If verbose, then also show the upstream abbrev name
  #   legacy   Do not use the '--count' option available in recent versions of git-rev-list
  #   git      Always compare HEAD to @{upstream}
  #   svn      Always compare HEAD to your SVN upstream
  #
  # By default, `__git_ps1` will compare HEAD to SVN upstream (`@{upstream}` if not available).
  # Also configurable per repository via `git config bash.showUpstream`.
  GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:="auto name verbose"}

  # +--------------------------------+
  # + Theme Options & Configurations +
  # +--------------------------------+
  # By default the name of the host is only shown for remote/SSH sessions.
  # When set to `true` the name will always be shown independent of the current session type.
  IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST=${IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST:-false}

  # By default the name of the user is only shown for remote/SSH sessions.
  # When set to `true` the name will always be shown independent of the current session type.
  IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER=${IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER:-false}

  # By default the time is always shown.
  # When set to `true` the segment won't be rendered.
  IGLOO_ZSH_PROMPT_THEME_HIDE_TIME=${IGLOO_ZSH_PROMPT_THEME_HIDE_TIME:-false}

  # +-----------------+
  # + Style Constants +
  # +-----------------+
  local ARROW="▶"             # \u25B6
  local CONNECTBAR_DOWN="┌─╼" # \u250C\u2500\u257C
  local CONNECTBAR_UP="└─╼"   # \u2514\u2500\u257C
  local SPLITBAR_GIT="╰╼"     # \u2570\u257C
  local SPLITBAR="╾─╼"        # \u257E\u2500\u257C
  local c_reset="%b%f%k"
  local newline=$'\n'
  local nord3="%F{8}"
  local nord7="%F{14}"
  local nord8="%F{6}"
  local nord9="%F{4}"
  local nord11="%F{1}"

  # +----------+
  # + Segments +
  # +----------+
  local seg_arrow="${nord3}${ARROW} ${c_reset}"
  local seg_connect_bar_down="${newline}${nord3}${CONNECTBAR_DOWN}${c_reset}"
  local seg_exit_status="%(?..${nord3}[%(?.${nord9}.${nord11})%?${nord3}]${SPLITBAR}${c_reset})"
  local seg_jobs="%(1j.${nord3}[${nord9}%j${nord3}]${c_reset}%(?.${nord3}${SPLITBAR}${c_reset}.).)"
  local seg_working_dir="${nord3}[${nord9}%~${nord3}]${newline}${c_reset}"

  local seg_time="${nord3}[${nord9}%D{%H:%M:%S}${nord3}]${newline}${CONNECTBAR_UP}${c_reset}"
  if [[ $IGLOO_ZSH_PROMPT_THEME_HIDE_TIME == true ]]; then
    seg_time=
  fi

  local is_remote_ssh seg_frag_host seg_frag_user seg_user_host
  [[ -n "$SSH_CLIENT" || -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]] && is_remote_ssh=true
  if [[ $IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER == true || $is_remote_ssh == true ]]; then
    seg_frag_user="%(!.%B${nord7}.${nord9})%n${c_reset}"
  fi
  if [[ $IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST == true || $is_remote_ssh == true ]]; then
    seg_frag_host="%f@${nord9}%m${c_reset}"
  fi
  if [[ -n $seg_frag_user || -n $seg_frag_host ]]; then
    seg_user_host="${nord3}[${seg_frag_user}${seg_frag_host}${nord3}]${SPLITBAR}${c_reset}"
  fi

  local seg_git
  # Only render the Git segment when the bundled prompt support script has been sourced and the current working
  # directory is actually a Git repository.
  if [[ $(typeset -f __git_ps1) && $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
    local git_commit_short="$(command git rev-parse --short HEAD 2> /dev/null)"
    seg_git=" ${nord3}${SPLITBAR_GIT}[${nord8}$(__git_ps1 "%s")${nord3}]${SPLITBAR}[${nord8}${git_commit_short}${nord3}]${c_reset}${newline}"
  fi

  #local seg_pyenv
  pyenv_check() {
  if [[ -z $VIRTUAL_ENV ]] then
    echo ""
  else
    echo "${nord3}(${nord11}.venv${nord3})${c_reset}"
  fi
  }

  PROMPT="${seg_connect_bar_down}${seg_user_host}${seg_jobs}${seg_exit_status}${seg_time}$(pyenv_check)${seg_working_dir}${seg_git}${seg_arrow}"
}

prompt_igloo_setup

