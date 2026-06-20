default :
	@echo "There is no default for your own safety."

git :
	@echo "Symlinking git dotfiles"
	ln -s $(HOME)/.dotfiles/git/gitconfig $(HOME)/.gitconfig
	ln -s $(HOME)/.dotfiles/git/gitignore $(HOME)/.gitignore

R :
	@echo "Symlinking R dotfiles"
	ln -s $(HOME)/.dotfiles/r/Rprofile.R $(HOME)/.Rprofile

fish :
	@echo "Symlinking fish config"
	ln -sfn $(HOME)/.dotfiles/fish $(HOME)/.config/fish

ghostty :
	@echo "Symlinking ghostty config"
	mkdir -p $(HOME)/.config/ghostty
	ln -sfn $(HOME)/.dotfiles/ghostty/config $(HOME)/.config/ghostty/config

emacs-install :
	brew tap d12frosted/emacs-plus && brew install emacs-plus@29 --with-debug --with-xwidgets --with-imagemagick --with-native-comp --with-savchenkovaleriy-big-sur-icon

apps:
	brew bundle install --file=$(HOME)/.dotfiles/homebrew/Brewfile

all : git R fish ghostty

.PHONY : all default git R fish ghostty
