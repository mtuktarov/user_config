#!/bin/bash

read_link(){
    target_file=$(which ./$0)
    cd `dirname $target_file`
    target_file=`basename $target_file`

    # Iterate down a (possible) chain of symlinks
    while [ -L "$target_file" ] ; do
        target_file=`readlink $target_file`
        cd `dirname $target_file`
        target_file=`basename $target_file`
    done

    # for the directory we're in and appending the target file.
    phys_dir=`pwd -P`
    result=$phys_dir/$target_file
    echo $result
}
my_location=$(read_link)
my_dir="${my_location%/*}"

which -s brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v brew ||  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v brew && {
    brew install git
    brew install bash-git-prompt
    brew install source-highlight
    brew install docker-completion
    brew install bash-completion
    brew install pip-completion
    brew install docker-completion
    brew install keychain
};

if [[ $(uname) == 'Linux' ]] ; then
    style_file=/usr/share/source-highlight/esc.style
    [ -f $style_file ] && grep -q "function black b;" $style_file && sudo sed -Ei 's/(function) black( b;)/\1\2/g' $style_file

    if [ -f ${HOME}/.bashrc ] && ! [ -h ${HOME}/.bashrc ] ; then
        mv ${HOME}/.bashrc ${my_dir}/.bashrc_old
    fi
    ln -fs ${my_dir}/bashrc ${HOME}/.bashrc

    if [ -f ${HOME}/.inputrc ] && ! [ -h ${HOME}/.inputrc ] ; then
        mv ${HOME}/.inputrc ${my_dir}/.input_old
    fi
    ln -fs ${my_dir}/inputrc ${HOME}/.inputrc

    if [ -f ${HOME}/.screenrc ] && ! [ -h ${HOME}/.screenrc ] ; then
        mv ${HOME}/.screenrc ${my_dir}/.screen_old
    fi  
    ln -fs ${my_dir}/screenrc ${HOME}/.screenrc

    if [ -f ${HOME}/.dir_colors ] && ! [ -h ${HOME}/.dir_colors ]; then
         mv ${HOME}/.dir_colors ${my_dir}/.dir_colors_old
    fi
    ln -fs ${my_dir}/dir_colors/dircolors.ansi-dark  ${HOME}/.dir_colors

elif [[ $(uname) == "Darwin" ]] ; then
    echo "" >> .bash_profile
fi
if [ -f ${HOME}/.vimrc ] && ! [ -h ${HOME}/.vimrc ] ; then
    mv ${HOME}/.vimrc ${my_dir}/.vimrc_old
fi  
ln -fs ${my_dir}/vimrc ${HOME}/.vimrc

if [ -f ${HOME}/.vim ] && ! [ -h ${HOME}/.vim ] ; then
    mv ${HOME}/.vim ${my_dir}/.vim_old
fi
ln -fs ${my_dir} ${HOME}/.vim

git submodule update --init
