#!/usr/bin/env bash
export PATH=$PATH/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

__git_ps1(){
    return 0
}

clear_dns(){
    [[ $(uname) == "Darwin" ]] && sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset.
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

which docker >/dev/null 2>&1 &&
{
    alias docker_rm='docker rm -f $(docker ps -a | awk '"'{ print $1}'"' | tail -n +2)'
    alias docker_rmi='docker rmi $(docker images | awk '"'{ print $3}'"' | tail -n +2)'
}
which kubectl >/dev/null 2>&1 &&
{
    alias pods_rm='kubectl delete po --force --grace-period=0 $(kubectl get po | awk '"'{print $1}'"' | tail -n +2)'
}
    [ -f /usr/lib/git-core/git-sh-prompt ] && source /usr/lib/git-core/git-sh-prompt
[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && source /usr/share/git-core/contrib/completion/git-prompt.sh
[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && source /usr/local/etc/bash_completion.d/git-prompt.sh

LESSPIPE=`which src-hilite-lesspipe.sh`    
[ -f $LESSPIPE ] && export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R '

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

