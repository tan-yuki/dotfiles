#!/bin/sh
cd $(dirname $0)

# copy dotsfile to home dir
for dotfile in .*
do
    if [ $dotfile != '.' ] &&
       [ $dotfile != '..' ] &&
       [ $dotfile != '.git' ] &&
       [ $dotfile != '.gitignore' ]
    then
        ln -fs $PWD/$dotfile $HOME
    fi
done

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
