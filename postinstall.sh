#!/bin/bash

# apt packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y -qq install \
	zsh \
	rxvt-unicode \
	git \
	i3 \
	nodejs \
	ranger \
		caca-utils \
		highlight \
		atool \
		w3m \
		poppler-utils mediainfo

# urxvt perl-extensions
wget -O ~/.urxvt/ext/keyboard-select https://raw.githubusercontent.com/muennich/urxvt-perls/master/keyboard-select
wget -O ~/.urxvt/ext/font-size https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size

# vim bundle manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install termite via script
curl -s https://raw.githubusercontent.com/emil14/termite-install/master/termite-install.sh | bash
cd ./termite-install/ && ./termite-install.sh
rm -rf ./termite-install ./termite ./vte-ng

# default config files to ~/.config/ranger
ranger --copy-config=all
