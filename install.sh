#!/usr/bin/env bash

echo Creating symlinks for dotfiles...

for file in .*
do
    if ! [ -d "$file" ]; then
        if [ ! -f ~/$file ]; then
            echo Creating symlink for "$file"
            ln -s "$(readlink -e "$file")" ~/$file
        fi
    fi
done

# use zsh as default shell
# chsh -s $(which zsh)

# Install oh-my-zsh
# if [ ! -d ~/.oh-my-zsh ]; then
#   echo Installing oh-my-zsh...
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# fi

if [ ! -d /code ]; then
  echo You should create /code and chown to regular user
if
