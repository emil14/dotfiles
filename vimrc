" Vim-Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' " universal set of defaults everyone can agree on
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " tree explorer
Plug 'itchyny/lightline.vim' " statusline
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " cli tool
Plug 'junegunn/fzf.vim' " fzf commands and mappings
Plug 'joshdick/onedark.vim' " dark color sheme
Plug 'sheerun/vim-polyglot' " collection of language packs
Plug 'w0rp/ale' " asynchronous lint engine
Plug 'mbbill/undotree' " history visualizer
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'mileszs/ack.vim' " run your favorite search tool from vim
Plug 'gioele/vim-autoswap' " dealing with swap files
Plug 'Yggdroot/indentLine' " display the indention levels
Plug 'blueyed/vim-diminactive' " dim inactive windows
Plug 'SirVer/ultisnips' " snippet engine
Plug 'honza/vim-snippets' " large collection of snippets
Plug 'posva/vim-vue', { 'for': ['vue'] } " syntax highlight for vue.js components

" deoplete - asynchronous completion framework
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" code-analysis engine for JavaScript
Plug 'carlitux/deoplete-ternjs', {
  \ 'do': 'npm install -g tern',
  \ 'for': ['javascript', 'javascript.jsx', 'vue']
\}

call plug#end()

runtime plugin/sensible.vim " override vim-sensible

" Colors
let g:onedark_terminal_italics=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark

" Spaces & Tabs
set wrap " this enables 'visual' wrapping
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " number of spaces to use for autoindenting
set expandtab " tabs are spaces
set smartindent " insert tabs on the start of a line according to shiftwidth, not tabstop

autocmd BufWritePre * :%s/\s\+$//e " automatically removing trailing whitespace

" UI Config
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set cursorcolumn " highlight current column
set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]
set hidden " hides buffers instead of closing them
set textwidth=80
set colorcolumn=+1,+41
set fillchars+=vert:│
set conceallevel=1

" hide the sign on blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[5 q"
let &t_EI .= "\<Esc>[3 q"

"autocmd InsertEnter * highlight CursorLine cterm=underline term=underline
"autocmd InsertLeave * highlight CursorLine cterm=NONE term=NONE

" highlight matches
set updatetime=300
au! CursorMoved * set nohlsearch
au! CursorHold * set hlsearch | let @/='\<'.expand("<cword>").'\>'
set hlsearch

" Searching
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase
set hlsearch " highlight search terms

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
nnoremap <space> za " space open/closes folds
set foldmethod=indent " fold based on indent level

" Movement
inoremap <C-c> <esc>
inoremap jk <esc>
" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader="," " leader is comma
nnoremap <leader>s :mksession<CR> " save session
nnoremap <leader>a :Ag " open ag.vim
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"Plugs

" ack.vim
if executable('ag') " use ag if available
  let g:ackprg = 'ag --vimgrep'
endif

" NERDTree
autocmd vimenter * NERDTree
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
map <C-n> :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" lightline
let g:lightline = {
      \ 'colorscheme': 'onedark'
      \ }
if !has('gui_running')
  set t_Co=256
endif

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" ale
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

" indentLine
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = 0
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_faster=1
let g:indentLine_concealcursor=''
set concealcursor=ic
let g:indentLine_char = '⎸'

" undotree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
nnoremap <F5> :UndotreeToggle<cr>

" vim-autoswap
set title titlestring= " enable the title option

" vim-diminactive
let g:diminactive_use_syntax = 1

" deoplete.
let g:deoplete#enable_at_startup = 1
