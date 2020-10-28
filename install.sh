#!/bin/bash

CRONTAB='/var/spool/cron/crontabs'
PWD=`pwd`
INITD='/etc/init.d'

sudo apt update

sudo apt install -y mc vim tmux zsh

# ********* VIM **********

$PWD/remove.sh

echo "------------- Vim configuration ... -------------"
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Create symbol link
ln -s $PWD/.vimrc $HOME/.vimrc

vim +PluginInstall +qall

# ********** TMUX **************
echo "------------- Tmux configuration ... -------------"
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux

ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
cp $HOME/.tmux/.tmux.conf.local $HOME/

sed -i "s~#{?battery_status, #{battery_status},}#{?battery_bar, #{battery_bar},}#{?battery_percentage, #{battery_percentage},} ,~ ~g" $HOME/.tmux.conf.local
# sed -i "s~screen-256color~xterm-256color~g" $HOME/.tmux.conf
# sed -i '12i\set-option -ga terminal-overrides ",xterm-256color:Tc"\' ~/.tmux.conf
# echo 'set-option -ga terminal-overrides ",xterm-256color:Tc"' >> $HOME/.tmux.conf
# ********** ZSH ***************
echo "------------- ZSH configuration ... -------------"
zsh --version

sudo chsh -s $(which zsh)

# Need reboot system

echo '-----------------------------------------------------'
echo "${YELLOW}Need Reboot!!!! after run script $PWD/after_reboot.sh ${RESET} "
echo '-----------------------------------------------------'
