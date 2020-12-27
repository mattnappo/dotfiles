export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="norm"
ZSH_THEME=cdimascio-lambda
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

# macOS stuff
alias ds="sudo find ./ -name ".DS_Store" -depth -exec rm {} \;"
alias touchbar='pkill "Touch Bar agent";killall "ControlStrip";'
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Macros
alias open="xdg-open "$@""
alias e="emacs -nw"
alias gf="gofmt -s -w ."
alias gn="systemctl suspend"

# SSH
alias aws="ssh ubuntu@3.13.204.246 -i ~/.ssh/aws_yb.pem"
alias demo="ssh ubuntu@ec2-13-58-186-37.us-east-2.compute.amazonaws.com -i ./.ssh/aws_yb.pem"
alias anton="ssh anton@192.168.1.200 -i ~/.ssh/id_anton_rsa -p 443"
alias webserver="ssh matt7@mattnappo.com"

# Vars
export GOPATH=$HOME/go
export GO111MODULE=on
export VISUAL="emacs";
export EDITOR="vim";
export BROWSER="firefox";

# Path adjustment
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/snap/bin
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:$PATH"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$PATH:$HOME/random/tools/julia-1.5.3/bin"

# Haskell
# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"


# set -o vi # Vim mode
