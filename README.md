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

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

then, exec vim, and `:PlugInstall`

see) https://github.com/junegunn/vim-plug

# Setup for `z`

```sh
touch $HOME/.z
```

# Install nerd font

see) https://github.com/ryanoasis/nerd-fonts

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

see) https://powerline.readthedocs.io/en/latest/installation.html

## Install powerline font

```sh
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ../
rm -rf fonts
```

see) https://github.com/powerline/fonts


## Install kubectl

```
brew install kubernetes-cli
```

see) https://kubernetes.io/ja/docs/tasks/tools/install-kubectl/
