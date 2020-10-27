#!/bin/bash

PWD=`pwd`

echo 'Reinstall ? [Y/n]:'
read reinstal

case $reinstal in 
    y*|Y*|"") 
    echo "Changing the shell..." 
    # Remove old file
    rm $HOME/.vimrc
    rm -rf $HOME/.vim
    rm -rf $HOME/.tmux
    rm $HOME/.tmux.conf
    rm $HOME/.tmux.conf.local
    rm -rf $HOME/.oh-my-zsh
    rm $HOME/.zshrc
    rm $HOME/.zshrc.pre-oh-my-zsh
    rm $HOME/.zsh_history
    ;;
    n*|N*) 
    echo "Shell change skipped."; 
    ;;
    *) 
    echo "Invalid choice. Shell change skipped."; 
    ;;
esac
