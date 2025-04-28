set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -U EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

source ~/.config/fish/conf.d/aliases.fish
source ~/.config/fish/conf.d/code.fish

# source local configs from conf.d/
source (dirname (status --current-filename))/conf.d/*.fish

# source os specific config
switch (uname)
    case Darwin
        source (dirname (status --current-filename))/osx.fish
    case Linux
        source (dirname (status --current-filename))/linux.fish
    case '*'
        source (dirname (status --current-filename))/windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

rbenv init - | source
pyenv init - | source
