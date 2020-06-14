#!/bin/bash

# Check to see script is running in $HOME
while true; do
    read -p "Are you in $HOME/ ? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

function update {
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

function install_kde {
    sudo apt-get install kde-full
}

function install_apps {
    sudo snap install discord spotify
    sudo snap install code alacritty skype --classic
    sudo apt-get install git curl wget vim zsh tmux htop
}

function install_fonts {
    mkdir -p ~/.local/share/fonts # Make the fonts folder
    git clone https://github.com/ZulwiyozaPutra/SF-Mono-Font.git # Download fonts
    cp SF-Mono-Font/*.otf # Install them
    fc-cache -f -v
    fc-list | grep SF
}

function install_dotfiles {
    git clone git@github.com:/xoreo/dotfiles.git
    ./dotfiles/install.sh
}

function install_dev_tools {
    wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz # Go
    tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # Rust
}

function install_ssh_keys {
    scp bolt@191.168.1.153:/Users/bolt/.ssh/id_xoreo_ed25519 ~/.ssh/
    echo "
    Host github.com
      Hostname github.com
      User git
      IdentityFile ~/.ssh/id_xoreo_ed25519
    " > ~/.ssh/config
}

function install_plugins {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # oh my zsh
    cp ~/dotfiles/.zshrc ~/.zshrc

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux tpm

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ # vim plug
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_themes {
    wget "https://raw.githubusercontent.com/cdimascio/lambda-zsh-theme/master/cdimascio-lambda.zsh-theme" \
        -o ~/.oh-my-zsh/themes/cdimascio-lambda.zsh-theme # zsh lambda theme

    # Konsole theme
    wget "https://store.kde.org/p/1216368/startdownload?file_id=1519398351&file_name=One%20Dark.colorscheme&file_type=text/plain&file_size=1010" \
        -o ~/.local/share/konsole/OneDark.colorscheme

    # Konsole profile
    cp ~/dotfiles/default.profile ~/.local/share/konsole
}

function install_nvidia_drivers {

}

function final {
    source ~/.zshrc
    source ~/.vimrc
    tmux source ~/.tmux.conf

    echo "Now all you need to run :PlugInstall in Vim!, and you'll be all set up!"
}
