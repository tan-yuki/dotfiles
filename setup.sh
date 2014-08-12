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

# clone neobundle.vim
cd .vim/bundle/
git clone https://github.com/Shougo/neobundle.vim.git
