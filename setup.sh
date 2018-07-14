#!/bin/bash

DOTFILES_REMOTE=https://github.com/krlvi/dotfiles.git
PREZTO_REMOTE=https://github.com/krlvi/prezto.git
HOSTS_FILE=https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

DOTFILES=~/dotfiles

echo "Updating the Hosts file";
curl $HOSTS_FILE | sudo tee -a /etc/hosts > /dev/null;

if test ! -e ~/.ssh/; then
  echo "Generating a new ssh key pair"
  ssh-keygen -t rsa -b 4096 -C "kiril.vi@runbox.no"
fi

echo "Installing xcode command line tools";
xcode-select --install;

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

echo "Installing Sdkman"
curl -s "https://get.sdkman.io" | bash

echo "Setting up Spacemacs";
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d;

echo "Setting up VIM youcompleteme"
cd ~/.vim/plugged/YouCompleteMe;
./install.py --go-completer;
cd -;

echo "Setting up symlinks"
ln -s "$DOTFILES/vim" ~/.vim;
ln -s "$DOTFILES/vimrc" ~/.vimrc;
ln -s "$DOTFILES/gitconfig" ~/.gitconfig;
ln -s "$DOTFILES/tmux.conf" ~/.tmux.conf;

echo "Configuring OSX"
chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

