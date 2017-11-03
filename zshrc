export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/emil.valeev/.oh-my-zsh
export VISUAL=vim
export EDITOR="$VISUAL"

ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

if type nvim > /dev/null 2>&1; then
  alias vi='nvim' # use some muscle memory
fi

# allows write the last visited directory into targetfile
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

# hello message on terminal open
GREEN='\033[0;32m'

echo -e "${GREEN}+---------------------------------------+"
echo -e "${GREEN}| Hello, friend.                        |"
echo -e "${GREEN}+---------------------------------------+"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
