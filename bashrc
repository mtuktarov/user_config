#!/usr/bin/env bash
export PATH=$PATH/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

__git_ps1(){
    return 0
}

alias ll='ls -la'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export LESS=' -R '
[ -f /usr/lib/git-core/git-sh-prompt ] && source /usr/lib/git-core/git-sh-prompt
[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && source /usr/share/git-core/contrib/completion/git-prompt.sh
[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && source /usr/local/etc/bash_completion.d/git-prompt.sh

clear_dns(){
    [[ $(uname) == "Darwin" ]] && sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset.
}
[[ $(uname) == "Darwin" ]] && export CLICOLOR=1


which kubectl >/dev/null 2>&1 &&
source <(kubectl completion bash) && # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
alias k=kubectl &&
complete -F __start_kubectl k
force_color_prompt=yes

PS1="\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[34m\]\h\[\033[36m\]\w\[\e[32m\]\$(__git_ps1)\[\e[m\]$ "

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

if [ -x /usr/bin/dircolors ] && [ -f $HOME/.dir_colors/dircolors.ansi-dark ]; then
    eval `dircolors $HOME/.dir_colors/dircolors.ansi-dark`
fi

if [[ $(uname) == 'Linux' ]] ; then
    alias ls='ls --color=auto'
    if  grep -q debian /etc/*release ; then
        LESSPIPE=`dpkg -L libsource-highlight-common | grep lesspipe`
    elif grep -q rhel /etc/*release ; then
        LESSPIPE=`rpm -ql source-highlight | grep lesspipe`
    fi
elif [[ $(uname) == "Darwin" ]] ; then
    LESSPIPE=`which src-hilite-lesspipe.sh`
fi

if [ -f $source_highlight_path ] ; then
    export LESSOPEN="| ${LESSPIPE} %s"
    export LESS=' -R -X -F '
fi
