export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="norm"
ZSH_THEME=cdimascio-lambda
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

# macOS stuff
alias touchbar='pkill "Touch Bar agent";killall "ControlStrip";'
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Aliases
alias open="xdg-open "$@""
alias e="emacs -nw"
alias vim="nvim"
alias gf="gofmt -s -w ."
alias l="ls -lahtr"
alias rm="rm -i"
alias mv="mv -i"
alias tag="ctags -R --exclude=.git ."
alias paclist="comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)"

# SSH
#alias aws="ssh ubuntu@3.13.204.246 -i ~/.ssh/aws_yb.pem"
alias demo="ssh ubuntu@ec2-13-58-186-37.us-east-2.compute.amazonaws.com -i ./.ssh/aws_yb.pem"
alias anton="ssh anton@192.168.1.200 -i ~/.ssh/id_anton_rsa -p 442"
alias website="ssh matt7@mattnappo.com"
alias fn="ssh -i ~/.ssh/fbdev.pem ubuntu@172.31.37.10"
alias aws-auth="aws-mfa --device arn:aws:iam::719462539905:mfa/matt.nappo@fiscalnote.com"
alias dev="ssh -i ~/.ssh/rfaas.pem ubuntu@ec2-3-86-29-219.compute-1.amazonaws.com"

# servers
export nuke="172.31.91.22"

# Vars
export GOPATH=$HOME/go
export GO111MODULE=on
export VISUAL="vim";
export EDITOR="vim";
export BROWSER="/usr/bin/firefox";

# Path adjustment
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/snap/bin
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:$PATH"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$PATH:$HOME/random/tools/julia-1.5.3/bin"
#export OPENAI_API_KEY="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"
export OPENAI_API_KEY="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"

# Haskell
# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

set -o vi # Vim mode

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ahj - remove the default Python environment artifact "(base)" from prompt
PS1=$(echo "$PS1" | perl -pe 's/^\(base\)\s*//' )

