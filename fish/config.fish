set fish_greeting ""

set -gx TERM xterm-256color

command -qv nvim && alias vim nvim

# fishvim
set -g fish_key_bindings fish_vi_key_bindings

set -gx EDITOR nvim
set -U EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

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

pyenv init - | source
