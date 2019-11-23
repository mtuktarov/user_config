#!/bin/sh

read_link(){
    target_file=$1

    cd `dirname $target_file`
    target_file=`basename $target_file`

    # iterate down a (possible) chain of symlinks
    while [ -l "$target_file" ]
    do
        target_file=`readlink $target_file`
        cd `dirname $target_file`
        target_file=`basename $target_file`
    done

    # compute the canonicalized name by finding the physical path 
    # for the directory we're in and appending the target file.
    phys_dir=`pwd -p`
    result=$phys_dir/$target_file

    echo $result
}

my_location=$(read_link $(which $0))
my_dir=${my_location%/*}

if [[ $(uname) == "Linux" ]] ; then
    if [ -f ${HOME}/.bashrc ] ; then
        mv ${HOME}/.bashrc ${my_dir}/.bashrc_old
    fi
    ln -fs ${my_dir}/bashrc ${HOME}/.bashrc

    if [ -f ${HOME}/.inputrc ] ; then
        mv ${HOME}/.inputrc ${my_dir}/.input_old
    fi
    ln -fs ${my_dir}/inputrc ${HOME}/.inputrc

    if [ -f ${HOME}/.screenrc ] ; then
        mv ${HOME}/.screenrc ${my_dir}/.screen_old
    fi  
    ln -fs ${my_dir}/screenrc ${HOME}/.screenrc
fi


if [ -f ${HOME}/.vimrc ] ; then
    mv ${HOME}/.vimrc ${my_dir}/.vimrc_old
fi  
ln -fs ${my_dir}/vimrc ${HOME}/.vimrc

git submodule update --init
