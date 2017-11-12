" Vim-Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')

Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggles between hybrid and absolute line numbers automatically
Plug 'blueyed/vim-diminactive' " dim inactive windows
Plug 'gioele/vim-autoswap' " dealing with swap files
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " tree explorer
Plug 'itchyny/lightline.vim' " statusline
Plug 'ryanoasis/vim-devicons' " file type glyphs/icons for popular Vim plugins
Plug 'Yggdroot/indentLine' " display the indention levels
Plug 'scrooloose/nerdcommenter' " plugin for intensely orgasmic commenting
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " cli tool
Plug 'junegunn/fzf.vim' " fzf commands and mappings
Plug 'mileszs/ack.vim' " run your favorite search tool from vim
Plug 'joshdick/onedark.vim' " dark color sheme
Plug 'sheerun/vim-polyglot' " collection of language packs
Plug 'posva/vim-vue' " syntax highlight for vue.js components
Plug 'w0rp/ale' " asynchronous lint engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous completion framework
Plug 'SirVer/ultisnips' " snippet engine
Plug 'honza/vim-snippets' " large collection of snippets
" code-analysis engine for JavaScript
Plug 'carlitux/deoplete-ternjs', {
  \ 'do': 'npm install -g tern',
  \ 'for': ['javascript', 'javascript.jsx']
\}

call plug#end()

" Load configuration modules
source ~/.config/nvim/colors.vim
source ~/.config/nvim/interface.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
