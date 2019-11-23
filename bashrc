export PATH=$PATH/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

if [ -f  /usr/local/etc/bash_completion.d/git-prompt.sh ] ; then
    .  /usr/local/etc/bash_completion.d/git-prompt.sh
fi

source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
alias k=kubectl
complete -F __start_kubectl k
force_color_prompt=yes
 PS1='\[\033[01;37m\]$? $(if [[ $? == 0 ]]; then echo "\[\033[01;32m\]\342\234\223"; else echo "\[\033[01;31m\]\342\234\227"; fi) \[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\033[00m\]$(__git_ps1 "(%s) ")\$ '
