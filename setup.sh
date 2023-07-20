#!/usr/bin/env bash 

VIM_HOME=$PWD

VIMRC=$HOME/.vimrc

backup() {
	mv $1 $1.bak
}

if [[ -f $VIMRC ]] then
	backup $VIMRC
fi

ln -s $VIM_HOME/vimrc $VIMRC
