#!/bin/sh
cd $(dirname $0)

sh ./link.sh

# clone neobundle.vim
cd .vim/bundle/
git clone https://github.com/Shougo/neobundle.vim.git

# build xcode command line tool
xcode-select --install

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# setup bundles
brew bundle

# install neobundle.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# setup powerline
# see) https://powerline.readthedocs.io/en/latest/
pip install --user powerline-status

# install font
# see) https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ../
rm -rf fonts

# setup for `gibo`
git clone https://github.com/github/gitignore ~/.gitignore-boilerplates
