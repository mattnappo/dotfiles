#!/bin/bash

# TODO: install alacritty with cargo install or git clone & cargo buils

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
    echo '-- UPDATE --'
    echo 'Updating system'
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

function install_kde {
    echo '-- KDE INSTALLER --'
    echo 'Installing kde-full'
    sudo apt-get install kde-full
}

function install_apps {
    echo '-- APP INSTALLER --'
    echo 'Installing essential applications and command line tools'
    sudo snap install discord spotify
    sudo snap install code skype --classic
    sudo apt-get install git curl wget vim zsh tmux htop

    sudo apt-get install zathura ranger
}

function install_fonts {
    echo '-- FONT INSTALLER --'
    echo 'Installing SF Mono'
    mkdir -p ~/.local/share/fonts # Make the fonts folder
    git clone https://github.com/Twixes/SF-Mono-Powerline.git
    git clone https://github.com/ZulwiyozaPutra/SF-Mono-Font.git
    cp SF-Mono-Font/*.otf # Install them
    cp SF-Mono-Powerline/*.otf # Install them
    fc-cache -f -v
    fc-list | grep SF
}

function install_dotfiles {
    echo '-- DOTFILE INSTALLER --'
    echo 'Installing latest dotfiles just in case this script is executing seperately'
    git clone git@github.com:/xoreo/dotfiles.git
    ./dotfiles/install.sh
}

function install_dev_tools {
    echo '-- LANGUAGE INSTALLER --'
    echo 'Installing Rust and Go'
    wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz # Go
    tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # Rust
}

function install_ssh_keys {
    echo '-- SSH KEY INSTALLER --'
    echo 'Attempting to get SSH keys from MacBook'
    scp bolt@191.168.1.153:/Users/bolt/.ssh/id_xoreo_ed25519 ~/.ssh/
    echo "
    Host github.com
      Hostname github.com
      User git
      IdentityFile ~/.ssh/id_xoreo_ed25519
    " > ~/.ssh/config
}

function install_plugins {
    echo '-- PLUGIN INSTALLER --'
    echo 'Installing plugin managers'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # oh my zsh
    cp ~/dotfiles/.zshrc ~/.zshrc

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux tpm

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ # vim plug
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_themes {
    echo '-- THEME INSTALLER --'
    echo 'Installing themes for zsh and Konsole'
    wget "https://raw.githubusercontent.com/cdimascio/lambda-zsh-theme/master/cdimascio-lambda.zsh-theme" \
        -o ~/.oh-my-zsh/themes/cdimascio-lambda.zsh-theme # zsh lambda theme

    # Konsole theme
    wget "https://store.kde.org/p/1216368/startdownload?file_id=1519398351&file_name=One%20Dark.colorscheme&file_type=text/plain&file_size=1010" \
        -o ~/.local/share/konsole/OneDark.colorscheme

    # Konsole profile
    cp ~/dotfiles/default.profile ~/.local/share/konsole
}

function install_nvidia_drivers {} # Probably best to do this manually

function call_all {
    update
    install_kde
    install_apps
    install_fonts
    install_dotfiles
    install_dev_tools
    install_ssh_keys
    install_plugins
    install_themes
    install_nvidia_drivers
    call_all
    final
}

function final {
    call_all()
    source ~/.zshrc
    source ~/.vimrc
    tmux source ~/.tmux.conf

    echo "Now all you need to run :PlugInstall in Vim!, and you'll be all set up!"
}
