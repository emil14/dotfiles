export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim

ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_UPDATE_PROMPT=true

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH

alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias man='tldr'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

