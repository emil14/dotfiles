#!/bin/bash

# apt packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y -qq \
  vim \
  zsh \
  git \
  i3 \
  rofi \
  ranger \
  xfonts-terminus \

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# terminus-ttf
curl -O https://files.ax86.net/terminus-ttf/files/latest.zip
unzip latest.zip && rm latest.zip
mv terminus-ttf-4.46.0 ~/.fonts
