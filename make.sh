#!/bin/bash

##########
#
# File: .make.sh
# Inspiration: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# Description: Creates symlinks the home directory to any desired dotfiles in ~/dotfiles
# Author: Henrique Leal <hm.leal@hotmail.com>
#
##########


########## Variables
dir=~/dotfiles
files="vimrc zshrc"


########## Create symlinks
for file in $files; do
    echo "Creating a symlink $file in home directory"
    ln -s $dir/$file ~/.file
done
