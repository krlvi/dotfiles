Main setup
`curl --silent https://raw.githubusercontent.com/krlvi/dotfiles/master/setup.sh | bash`

Zsh setup
`zsh`
`git clone --recursive git@github.com:krlvi/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"`
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
`chsh -s /bin/zsh`
