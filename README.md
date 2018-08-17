* Xcode command line tools
`xcode-select --install`

* Brew packages
`curl --silent https://raw.githubusercontent.com/krlvi/dotfiles/master/setup.sh | bash`

* zsh
```
zsh
git clone --recursive git@github.com:krlvi/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
```

* ssh
`ssh-keygen -t rsa -b 4096 -C "kiril.vi@runbox.no"`

* SDKMan
`curl -s "https://get.sdkman.io" | bash`

* Hosts file
`curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | sudo tee -a /etc/hosts > /dev/null`

* Spacemacs
`git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d`

* OSX
```
chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write -g ApplePressAndHoldEnabled -bool false
```
