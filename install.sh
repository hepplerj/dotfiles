#!/usr/bin/env bash

echo "Initializing submodules"
git submodule init
git submodule update

echo "Deleting old files"
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.gvimrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf
rm ~/.vim
rm ~/.vimrc
rm ~/.zshrc

echo "Symlinking files"
ln -s ~/github/dotfiles/bashrc ~/.bashrc
ln -s ~/github/dotfiles/bash_profile ~/.bash_profile
ln -s ~/github/dotfiles/gitconfig ~/.gitconfig
ln -s ~/github/dotfiles/gitignore ~/.gitignore
ln -s ~/github/dotfiles/githelpers ~/.githelpers
ln -s ~/github/dotfiles/gvimrc ~/.gvimrc
ln -s ~/github/dotfiles/tmux ~/.tmux.conf
ln -s ~/github/dotfiles/vimrc ~/.vimrc
ln -s ~/github/dotfiles/zshrc ~/.zshrc

echo "Symlinking directories"
ln -s ~/github/dotfiles/vim ~/.vim

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "Done!"
