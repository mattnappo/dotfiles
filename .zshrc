export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="norm"
# ZSH_THEME="cloud"
ZSH_THEME=cdimascio-lambda

plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

figlet kawaiiOS

# Server ip
export SERVER="192.168.1.200"

# Macros
alias ds="sudo find ./ -name ".DS_Store" -depth -exec rm {} \;"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron $1"
alias anton="ssh anton@$SERVER -i ~/.ssh/id_anton_rsa -p 443"
alias term="open /Applications/term/cool-retro-term.app"
alias touchbar='pkill "Touch Bar agent";killall "ControlStrip";'
alias gcc="/usr/bin/gcc "$@""
alias aws="ssh ubuntu@3.13.204.246 -i ~/.ssh/aws_yb.pem"
alias demo="ssh ubuntu@ec2-13-58-186-37.us-east-2.compute.amazonaws.com -i ./.ssh/aws_yb.pem"
alias open="xdg-open "$@""
alias e="emacs -nw"
alias gf="gofmt -s -w ."
alias svol="pactl -- set-sink-volume 0 $1"
alias svol2="amixer -D pulse set Master $1%"
alias gn="systemctl suspend"
alias update="sudo apt-get update -y && sudo apt-get upgrade"

# Enable MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Vars
export GOPATH=$HOME/go
export GO111MODULE=on
export VISUAL="emacs -nw";
export EDITOR="emacs -nw";
export BROWSER="firefox";

export SPICETIFY_INSTALL="/home/matt/spicetify-cli"

# Path adjustment
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/snap/bin
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:$PATH"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$PATH:$HOME/random/tools/julia-1.5.3/bin"

# set -o vi # Vim mode

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
