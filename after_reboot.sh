#!/bin/bash

PWD=`pwd`
CRONTAB='/var/spool/cron/crontabs'
INITD='/etc/init.d'


# Configured default .zshrc
#cp $PWD/.zshrc.default $PWD/.zshrc
#sed -i "s~oh_my_zsh_path~$HOME/.oh-my-zsh~g" $PWD/.zshrc
#ln -s $PWD/.zshrc $HOME/.zshrc


# Installing oh-my-zsh framework
echo '---------- Installing oh-my-zsh ----------'
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Installing zsh-syntax-highlighting
echo '---------- Installing zsh-syntax-highlighting ----------'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Installing zsh-autosuggestions
echo '---------- Installing zsh-autosuggestions ----------'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Configured default .zshrc
echo '---------- Configuretions ZSH ----------'
cp $PWD/.zshrc.default $HOME/.zshrc
sed -i "s~oh_my_zsh_path~$HOME/.oh-my-zsh~g" $HOME/.zshrc
#ln -s $PWD/.zshrc $HOME/.zshrc

# Commenting line in configuration
sed -i "s~  prompt_context~#  prompt_context~g" $PWD/.oh-my-zsh/themes/agnoster.zsh-theme

sudo reboot
echo '---------- DONE ----------'






