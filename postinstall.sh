#!/bin/bash

dependencies=(zsh rxvt-unicode git i3 nodejs ranger)

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install ${dependencies}

wget -O ~/.urxvt/ext/keyboard-select https://raw.githubusercontent.com/muennich/urxvt-perls/master/keyboard-select
wget -O ~/.urxvt/ext/font-size https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
