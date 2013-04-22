#!/usr/bin/env bash

cd "${HOME}/.dotfiles"
echo "Initializing submodules"
git submodule --quit update --init
cd "${OLDPWD}"

echo "Symlinking files"
ln -fs ".dotfiles/bash/bashrc"          "${HOME}/.bashrc"
ln -fs ".dotfiles/bash/bash_profile"    "${HOME}/.bash_profile"
ln -fs ".dotfiles/git/gitconfig"        "${HOME}/.gitconfig"
ln -fs ".dotfiles/git/gitignore"        "${HOME}/.gitignore"
ln -fs ".dotfiles/git/githelpers"       "${HOME}/.githelpers"
ln -fs ".dotfiles/tmux/tmux.conf"       "${HOME}/.tmux.conf"
ln -fs ".dotfiles/vim/vimrc"            "${HOME}/.vimrc"
ln -fs ".dotfiles/mutt/muttrc"          "${HOME}/.muttrc"
ln -fs ".dotfiles/zshrc"                "${HOME}/.zshrc"
ln -fs ".dotfiles/mutt/offlineimaprc"   "${HOME}/.offlineimaprc"

echo "Symlinking directories"
[[ -e "${HOME}/.vim" ]] && rm -r "${HOME}/.vim"
[[ -e "${HOME}/.mutt" ]] && rm -r "${HOME}/.mutt"
ln -fs ".dotfiles/vim" "${HOME}/.vim"
ln -fs ".dotfiles/mutt" "${HOME}/.mutt"

echo "Done! Restart terminal and vim."
