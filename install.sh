#!/usr/bin/env bash

echo "Initializing submodules"
git submodule init
git submodule update

echo "Deleting old files"
rm ~/.vimrc
rm ~/.zshrc
rm ~/.vim
rm ~/.gvimrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf

echo "Symlinking files"
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/zshrc ~/.zshrc
ln -s ~/git/dotfiles/vim ~/.vimrc
ln -s ~/git/dotfiles/gvimrc ~/.gvimrc
ln -s ~/git/dotfiles/gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/gitignore ~/.gitignore
ln -s ~/git/dotfiles/tmux ~/.tmux.conf
ln -s ~/git/dotfiles/githelpers ~/.githelpers

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "Done!"
