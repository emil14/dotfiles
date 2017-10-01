export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/emil.valeev/.oh-my-zsh
export VISUAL=vim
export EDITOR="$VISUAL"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# hello message on terminal open
GREEN='\033[0;32m'

echo -e "${GREEN}+---------------------------------------+"
echo -e "${GREEN}| Hello, friend.                        |"
echo -e "${GREEN}+---------------------------------------+"
