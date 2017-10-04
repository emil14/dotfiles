#!/bin/bash

# apt packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y -qq install \
	zsh \
	git \
	i3 \
	nodejs \
	ranger \
		caca-utils \
		highlight \
		atool \
		w3m \
		poppler-utils mediainfo

# vim bundle manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install termite via script
curl -s https://raw.githubusercontent.com/emil14/termite-install/master/termite-install.sh | bash
cd ./termite-install/ && ./termite-install.sh
rm -rf ./termite-install ./termite ./vte-ng
