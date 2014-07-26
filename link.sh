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
