#!/bin/bash

# apt packages
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y -qq install \
  zsh \
  neovim \
  git \
  i3 \
  silversearcher-ag \
  python3-pip \
  nodejs \
  ruby-full \
  ranger \
    caca-utils \
    highlight \
    atool \
    w3m \
    poppler-utils mediainfo

# nerd-fonts
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts && ./install.sh
cd ../ && rm -rf nerd-fonts

# ranger-devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons
cd ranger_devicons && make install
cd ../ && rm -rf ranger_devicons

# Ruby-provider for NeoVim
gem install neovim

# vim plugins and theme
vim +PluginInstall +qall
cp -r ~/.vim/bundle/onedark.vim/autoload/lightline/colorscheme/onedark.vim /.vim/autoload/lightline/colorscheme/

# termite
curl -s https://raw.githubusercontent.com/emil14/termite-install/master/termite-install.sh | bash
cd ./termite-install/ && ./termite-install.sh
rm -rf ./termite-install ./vte-ng

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
