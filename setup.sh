#!/usr/bin/env bash 

VIM_HOME=$PWD

VIMRC=$HOME/.vimrc

backup() {
	mv $1 $1.bak
}

setenv() {
	echo 'export HQ_VIM_HOME='$PWD >> $HOME/.bashrc
	echo 'export HQ_VIM_CONF=$HQ_VIM_HOME/init.vim' >> $HOME/.bashrc
}

if [[ -f $VIMRC ]]; then
	backup $VIMRC
fi

ln -s $VIM_HOME/vimrc $VIMRC

setenv
