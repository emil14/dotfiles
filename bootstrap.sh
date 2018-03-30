#!/bin/bash

# apt packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y -qq \
  vim \
  zsh \
  git \
  curl \
  i3 \
    i3blocks \
  rofi \
  ranger \
  xfonts-terminus \

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash

# npm packages
npm i -g diff-so-fancy

# terminus-ttf
curl -O https://files.ax86.net/terminus-ttf/files/latest.zip
unzip latest.zip && rm latest.zip
mv terminus-ttf-4.46.0 ~/.fonts

# vs-code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
