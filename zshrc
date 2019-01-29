export PATH="$HOME/.bin:/usr/local/bin:/sbin:/usr/sbin:/snap/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS="7"
export EDITOR="vim"
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/projects/go"
export PIP_REQUIRE_VIRTUALENV="true"

ZSH_THEME="bira"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_UPDATE_PROMPT="true"

# zsh
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

<<<<<<< HEAD
=======
# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


>>>>>>> ac0f248ea7b4b213629abbe1f3727c1de290d429
# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh

# aliases
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias chromium='chromium --disable-sync-preferences'
alias cp='cp -r'
alias scp='scp -r'
alias rm='rm -r'
alias mkdir='mkdir -p'
alias ls='ls --all --classify --file-type --color=auto'
alias ll='ls -l --human-readable'
alias py='ptpython'
alias pe='pipenv'

