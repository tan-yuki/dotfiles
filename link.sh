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
        if [ -d $HOME/$dotfile ] && [ -d $PWD/$dotfile ]; then
            mv -f $HOME/$dotfile/* $PWD/$dotfile
            rmdir $HOME/$dotfile
        fi
        ln -fs $PWD/$dotfile $HOME
    fi
done
