#!/bin/bash

# -- Create a backup of the system's current dotfiles
function backup {
    BACKUPNAME="backup-$(date +%m-%d-%y-%T)"
    BACKUP=/home/matt/dotfiles_backups/$BACKUPNAME/

    mkdir -p $BACKUP
    cp ~/.vimrc ~/.tmux.conf ~/.zshrc $BACKUP
    cp -r ~/.doom.d $BACKUP

    mkdir -p $BACKUP/awesome/
    cp ~/.config/awesome/rc.lua $BACKUP/awesome/

    mkdir -p $BACKUP/alacritty/
    cp ~/.config/alacritty/*.yml $BACKUP/alacritty/

    cp -r ~/.config/rofi/ $BACKUP
}

# -- Update the repo with the system's dotfiles
function update {
    cp ~/.vimrc ~/.tmux.conf ~/.zshrc ~/dotfiles/
    cp -r ~/.doom.d ~/dotfiles/

    cp ~/.config/awesome/rc.lua  ~/dotfiles/config/awesome/
    cp ~/.config/alacritty/*.yml ~/dotfiles/config/alacritty/

    cp -r ~/.config/rofi/ ~/dotfiles/config/
}

backup
update

