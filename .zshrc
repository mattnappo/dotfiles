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

alias term="open /Applications/term/cool-retro-term.app"
alias gcc="/usr/bin/gcc "$@""

alias ds="sudo find ./ -name ".DS_Store" -depth -exec rm {} \;"
alias nano='/usr/local/Cellar/nano/3.2/bin/nano --smooth --tabstospaces --linenumbers'
alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron $1"
alias psql="/Library/PostgreSQL/12/scripts/runpsql.sh $@"

# MacPorts Installer addition on 2018-07-19_at_10:47:37: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# FOR GO
export GOPATH=$HOME/go
export GO111MODULE=on
# export GO111MODULE=auto
export EDITOR="vim"
export SERVER="192.168.1.200"
export HOMENETWORK="72.80.151.67"
alias antonl="ssh anton@$SERVER"
alias anton="ssh anton@$HOMENETWORK"
alias gf="gofmt -s -w ."

alias touchbar='pkill "Touch Bar agent";killall "ControlStrip";'
alias nc="/usr/bin/nc $@"

export TERM=screen-256color
