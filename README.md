## Create dotfiles symlinks

```sh
sh ./link.sh
```

## Build xcode command line tool

```sh
xcode-select --install
```

## Install JDK

http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

# Install brew

https://docs.brew.sh/Installation

# Setup bundles

```sh
brew bundle
```

# Install vim-plug

exec vim, and `:PlugInstall`

# Setup for `z`

```sh
touch $HOME/.z
```

# Install nerd font

See: https://github.com/ryanoasis/nerd-fonts

# Install pyenv

```
brew install pyenv
pyenv install 3.7.5
pyenv global 3.7.5
pyenv rehash
```

# Install powerline

```
pip install powerline-status
pip install --user git+git://github.com/powerline/powerline
```

## Install powerline font

```sh
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ../
rm -rf fonts
```

see) https://github.com/powerline/fonts

