#!/bin/bash

# Apt packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y -qq snap zsh git vim curl terminator postgresql-10

# Snap packages
sudo snap refresh
sudo snap install chromium telegram-desktop code --classic

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# PyEnv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
pyenv update

# Diff so fancy
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy --create-dirs -o ~/.bin/diff-so-fancy

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ZSH autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ZSH syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# nerd-fonts
git clone https://github.com/ryanoasis/nerd-fonts
cd ./nerd-fonts/install.sh && rm -rf nerd-fonts
./nerd-fonts/install.sh

# Hermit font
curl https://pcaro.es/d/otf-hermit-1.21.tar.gz --output ~/.fonts/hermit.tar.gz
tar -xzf ~/.fonts/hermit.tar.gz && rm ~/.fonts/hermit.tar.gz
