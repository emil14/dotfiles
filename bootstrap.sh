#!/bin/bash

# apt packages
sudo apt-get -y update
sudo apt-get -y upgrade
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

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
