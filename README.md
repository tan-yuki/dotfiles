## Create dotfiles symlinks

```sh
sh ./link.sh
```

## Build xcode command line tool

# Install brew

https://docs.brew.sh/Installation

# Setup bundles

```sh
brew bundle
```

# Setup asdf

## nodejs

```
asdf plugin add nodejs
asdf install nodejs 17.6.0
```

# Install vim-plug

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

then, exec vim, and `:PlugInstall`

see) https://github.com/junegunn/vim-plug


# Install nerd font

see) https://github.com/ryanoasis/nerd-fonts

# Install pyenv

```
brew install pyenv
pyenv install 3.7.12
pyenv global 3.7.12
pyenv rehash
```

※) neovimがpyenv前提のため、asdf経由ではなくpyenv経由でpythonをセットアップする

# Install powerline

```
pip install powerline-status
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
