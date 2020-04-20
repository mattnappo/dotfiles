export ZSH="/Users/bolt/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
#ZSH_THEME="norm"
# ZSH_THEME="cloud"
ZSH_THEME=cdimascio-lambda

plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

# Setting PATH for Python 3.5
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
export PATH=$PATH:/Users/bolt/anaconda3/bin

# Macros
alias ds="sudo find ./ -name ".DS_Store" -depth -exec rm {} \;"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron $1"
alias psql="/Library/PostgreSQL/12/scripts/runpsql.sh $@"
alias anton="ssh anton@$SERVER -i ~/.ssh/id_anton_rsa -p 443"
alias term="open /Applications/term/cool-retro-term.app"
alias touchbar='pkill "Touch Bar agent";killall "ControlStrip";'
alias gcc="/usr/bin/gcc "$@""

# Enable MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Vars
export GOPATH=$HOME/go
export GO111MODULE=on

export EDITOR="vim"
export SERVER="192.168.1.200"
alias gf="gofmt -s -w ."

export TERM=screen-256color

