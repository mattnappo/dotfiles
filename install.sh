#!/bin/sh

# Install dotfiles
cp ~/dotfiles/.vimrc ~
cp ~/dotfiles/.tmux.conf ~
cp ~/dotfiles/.zshrc ~

# Install tmux config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

