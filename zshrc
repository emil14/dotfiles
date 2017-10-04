export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/emil.valeev/.oh-my-zsh
export VISUAL=vim
export EDITOR="$VISUAL"

ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# hello message on terminal open
GREEN='\033[0;32m'

echo -e "${GREEN}+---------------------------------------+"
echo -e "${GREEN}| Hello, friend.                        |"
echo -e "${GREEN}+---------------------------------------+"
