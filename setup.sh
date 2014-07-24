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

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
