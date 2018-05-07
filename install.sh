#!/bin/bash

echo Creating symlinks for dotfiles...

for file in .*
do
    if ! [ -d "$file" ]; then
        if [ ! -f ~/$file ]; then
            echo Creating symlink for" $file
            ln -s "$(readlink -e "$file")" ~/$file
        fi
    fi
done

echo Installing oh-my-zsh...

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
