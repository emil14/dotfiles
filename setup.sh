#!/bin/bash

# Apt packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y -qq \
  snap \
  zsh \
  git \
  vim \
  curl \
  xfonts-terminus

# Snap packages
sudo snap refresh
sudo snap install \
  chromium \
  telegram-desktop \
  vscode

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash

# NPM packages
npm i -g diff-so-fancy

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ZSH autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ZSH syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# TerminusTTF font
curl -O https://files.ax86.net/terminus-ttf/files/latest.zip
unzip latest.zip && rm latest.zip
mv terminus-ttf-4.46.0 ~/.fonts

# Hermit font
curl https://pcaro.es/d/otf-hermit-1.21.tar.gz --output ~/.fonts/hermit.tar.gz
tar -xzf ~/.fonts/hermit.tar.gz && rm ~/.fonts/hermit.tar.gz

# Switch shell to ZSH
chsh -s /usr/bin/zsh

# Set Chromium as a default browser
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /snap/bin/chromium 200
