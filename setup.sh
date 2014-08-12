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

# install neobundle.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# setup bundles
brew bundle

# setup python
pip install --upgrade setuptools
pip install --upgrade pip

# setup powerline
pip install --user psutil
pip install --user git+git://github.com/Lokaltog/powerline

# setup nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.12.0/install.sh | bash
sh ~/.nvm/install.sh

# install node
nvm install v0.10.29

# setup npm
curl -L https://npmjs.org/install.sh | sh
