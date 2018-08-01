#!/bin/bash

#
# Basic packages
#

# APT packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y -qq \
  snap \
  zsh \
  git \
  vim \
  scrot \
  curl \
  rofi \
  comption \
  ranger \
  xfonts-terminus \
  font-awesome

# Snapcraft packages
sudo snap refresh
sudo snap install \
  chromium \
  telegram-desktop \
  tldr

# Node Version Manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash

# NPM packages
npm i -g diff-so-fancy

#
# Window manager and friends
#

# i3-gaps
sudo apt install \
  libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
  libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev \
  libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 \
  libxcb-xrm-dev \
  automake
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
autoreconf --force --install && rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make && sudo make install

# i3lock-fancy
git clone https://github.com/meskarune/i3lock-fancy
sudo cp -r i3lock-fancy/{lock,icons} /usr/local/bin
rm -rf i3lock-fancy

# Polybar
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu zesty-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo apt update
sudo apt install polybar

### Shell things ###

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ZSH autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ZSH syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#
# Other
#

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

# TerminusTTF font
curl -O https://files.ax86.net/terminus-ttf/files/latest.zip
unzip latest.zip && rm latest.zip
mv terminus-ttf-4.46.0 ~/.fonts

# Termite terminal emulator
git clone https://github.com/Corwind/termite-install.git && cd termite-install
chmod +x ./termite-install.sh && ./termite-install.sh
cd ../ && rm -r termite-install

#
# Configurations
#

# Switch shell to ZSH
chsh -s /usr/bin/zsh
