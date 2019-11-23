export PATH=/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
alias k=kubectl
complete -F __start_kubectl k
force_color_prompt=yes
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\]'
