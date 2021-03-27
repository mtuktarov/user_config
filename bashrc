#!/usr/bin/env bash
export PATH=$HOME/.bin:$HOME/.local/bin:$PATH/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

__git_ps1(){
    return 0
}

clear_dns(){
    [[ $(uname) == "Darwin" ]] && sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset.
}

docker_rm(){
    which docker >/dev/null 2>&1 && docker rm -f $(docker ps -a | awk '{ print $1}' | tail -n +2)
}

docker_rmi(){
    which docker >/dev/null 2>&1 && docker rmi $(docker images | awk '{ print $3}' | tail -n +2)
}

pods_rm(){
    which kubectl >/dev/null 2>&1 && kubectl delete po --force --grace-period=0 $(kubectl get po | awk '{print $1}' | tail -n +2)
}

alias ll='ls -la'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
if [[ $(uname) == "Darwin" ]] ; then
    export CLICOLOR=1
elif [[ $(uname) == 'Linux' ]] ; then
    alias ls='ls --color=auto'
fi

eval `keychain --eval --agents ssh --inherit any id_rsa`
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

LESSPIPE=`which src-hilite-lesspipe.sh`    
[ -f $LESSPIPE ] && export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -F '

which kubectl >/dev/null 2>&1 &&
source <(kubectl completion bash) && # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
alias k=kubectl && complete -F __start_kubectl k

PS1="\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[34m\]\H\[\033[36m\]\w\[\e[32m\]\$(__git_ps1)\[\e[m\]$ "
export TERM=xterm-256color
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"


if [ -x /usr/bin/dircolors ] && [ -f $HOME/.dir_colors ]; then
    eval `dircolors $HOME/.dir_colors`
fi
export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG=C 

