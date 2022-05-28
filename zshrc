# ZSH
export PATH="/usr/local/bin:/usr/local/go/bin:$HOME/bin:$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS="14"

ZSH_THEME="bira"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ALIASES
alias lighton="echo 3 | sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness"
alias lightoff="echo 0 | sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness"
alias k="kubectl"
alias code="GTK_IM_MODULE=ibus code"
alias whosonport="sudo lsof -i -P | grep"

# GOLANG
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$GOROOT/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # loads nvm bash_completion

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

