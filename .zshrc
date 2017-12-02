# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/vivek/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Search for _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git dnf pip tmux)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Tmuxinator
source ~/.bin/tmuxinator.zsh

export GOPATH=$HOME

function emulator { (cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@";) }

# autosuggestions plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export ANDROID_HOME=/home/vivek/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


# some aliases
alias tx=tmuxinator
alias info=info --vi-keys
alias gpg=gpg2
alias rswp='sudo rm -r ~/.vim/dirs/tmp/'


# stupid fucking typos
alias clera=clear
alias cler=clear
alias cl=clear
alias cle=clear
alias clea=clear
alias clr=clear
alias clar=clear
alias clra=clear
alias exiy=exit
alias exi=exit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
