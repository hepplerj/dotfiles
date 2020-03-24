default :
	@echo "There is no default for your own safety."

git :
	@echo "Symlinking git dotfiles"
	ln -s $(HOME)/.dotfiles/git/gitconfig $(HOME)/.gitconfig 
	ln -s $(HOME)/.dotfiles/git/gitignore $(HOME)/.gitignore

R :
	@echo "Symlinking R dotfiles"
	ln -s $(HOME)/.dotfiles/r/Rprofile.R $(HOME)/.Rprofile 

zsh :
	@echo "Symlinking ZSH dotfiles"
	ln -s $(HOME)/.dotfiles/zsh/zshrc.zsh $(HOME)/.zshrc 

neovim :
	@echo "Symlinking Neovim dotfiles"
	ln -s $(HOME)/.dotfiles/neovim $(HOME)/.config/nvim

vscode-mac :
	@echo "Symlinking Visual Studio Code settings for Mac"
	ln -s $(HOME)/.dotfiles/vscode/settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	# ln -s $(HOME)/.dotfiles/vscode/snippets $(HOME)/Library/Application\ Support/Code/User/snippets

all : git R latex zsh neovim vscode-mac

.PHONY : all default git R zsh neovim vscode-mac