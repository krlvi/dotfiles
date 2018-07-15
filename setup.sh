#!/bin/bash

DOTFILES_REMOTE=https://github.com/krlvi/dotfiles.git
DOTFILES=~/dotfiles

if test ! $(which brew); then
  echo "Installing homebrew";
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

if test -e $DOTFILES_REPO; then
  git -C $DOTFILES pull origin master &> /dev/null;
else
  echo "Cloning dotfiles into ${DOTFILES}";
  git clone --recursive "$DOTFILES_REMOTE" $DOTFILES;
fi

echo "Installing ${DOTFILES}/Brewfile packages";
brew bundle --file=$DOTFILES/Brewfile;

echo "Setting up symlinks"
ln -s "$DOTFILES/vim" ~/.vim;
ln -s "$DOTFILES/vimrc" ~/.vimrc;
ln -s "$DOTFILES/gitconfig" ~/.gitconfig;
ln -s "$DOTFILES/tmux.conf" ~/.tmux.conf;
