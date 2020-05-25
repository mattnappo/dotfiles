#!/bin/sh

# Install dotfiles
cp ~/dotfiles/.vimrc ~
cp ~/dotfiles/.tmux.conf ~
cp ~/dotfiles/.zshrc ~

tmux source ~/.tmux.conf

if [[ $1 == "fresh" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

