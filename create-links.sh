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
