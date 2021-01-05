#!/bin/bash

while true; do
    read -p "Are you sure that you want to install these dotfiles to your system? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

cp ~/dotfiles/.doom.d/* ~/.doom.d/
cp ~/dotfiles/.tmux.conf ~/
cp ~/dotfiles/.vimrc ~/
cp ~/dotfiles/.zshrc ~/

cp ~/dotfiles/config/alacritty/*.yml ~/.config/alacritty/
cp ~/dotfiles/config/awesome/rc.lua ~/.config/awesome/
# cp ~/dotfiles/config/compton/compton.conf ~/.config/compton/
cp ~/dotfiles/config/nitrogen/* ~/.config/nitrogen/
