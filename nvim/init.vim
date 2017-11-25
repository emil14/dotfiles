" Vim-Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins loading
call plug#begin('~/.vim/plugged')

Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggles between hybrid and absolute line numbers automatically
Plug 'blueyed/vim-diminactive' " dim inactive windows
Plug 'gioele/vim-autoswap' " dealing with swap files
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " tree explorer
Plug 'itchyny/lightline.vim' " statusline
Plug 'Yggdroot/indentLine' " display the indention levels
Plug 'tomtom/tcomment_vim' " comment vim-plugin
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " cli tool
Plug 'junegunn/fzf.vim' " fzf commands and mappings
Plug 'mileszs/ack.vim' " run your favorite search tool from vim
Plug 'joshdick/onedark.vim' " dark color sheme
Plug 'sheerun/vim-polyglot' " collection of language packs
Plug 'w0rp/ale' " asynchronous lint engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous completion framework
Plug 'SirVer/ultisnips' " snippet engine
Plug 'honza/vim-snippets' " large collection of snippets
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters
Plug 'Raimondi/delimitMate' " enable an auto-close chars feature
Plug 'haya14busa/incsearch.vim' " Improved incremental searching for
" code-analysis engine for JavaScript
Plug 'carlitux/deoplete-ternjs', {
  \ 'do': 'npm install -g tern',
  \ 'for': ['javascript', 'javascript.jsx']
\}

call plug#end()

" Configuration modules loading
source ~/.config/nvim/colors.vim
source ~/.config/nvim/core-settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins-settings.vim
