#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

echo "Creating symlinks"
linkables=$( find . -name "*.symlink" -exec basename {} \; )
for file in $linkables ; do
  target="$HOME/$( basename $file ".symlink"  )"
  echo "Creating symlink for $file"
  ln -s $DOTFILES/$file $target
done