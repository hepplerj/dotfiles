alias zz 'open -a Zed .'

function serve
	npx http--server --port 8000 $argv
end

set LS_COLORS dxfxcxdxbxegedabagacad

alias l ls
alias ls 'ls -FG'
alias c clear
alias vim nvim 
alias v nvim 

function brew-outdated-leaves -d "List outdated packages, but only _leaf_ packages"
    combine (brew outdated | cut -d'(' -f1 | cut -d'@' -f1 | psub) and (brew leaves | psub) | xargs brew outdated
end

