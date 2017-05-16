#!/bin/sh
brew tap Homebrew/brewdler

cd $(dirname $0)

sh ./link.sh

# clone neobundle.vim
cd .vim/bundle/
git clone https://github.com/Shougo/neobundle.vim.git

# build xcode command line tool
xcode-select --install

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install neobundle.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# setup bundles
brew bundle
