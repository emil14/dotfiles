#!/bin/bash

# apt packages
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y -qq install \
	zsh \
	git \
	i3 \
	nodejs \
  silversearcher-ag \
	ranger \
		caca-utils \
		highlight \
		atool \
		w3m \
		poppler-utils mediainfo

# neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim bundle manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# vim plugins and theme
vim +PluginInstall +qall
cp -r ~/.vim/bundle/onedark.vim/autoload/lightline/colorscheme/onedark.vim /.vim/autoload/lightline/colorscheme/

# install termite via script
curl -s https://raw.githubusercontent.com/emil14/termite-install/master/termite-install.sh | bash
cd ./termite-install/ && ./termite-install.sh
rm -rf ./termite-install ./vte-ng

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
