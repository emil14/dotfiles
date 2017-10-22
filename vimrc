scriptencoding utf-8
set encoding=utf-8

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'w0rp/ale'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'gioele/vim-autoswap'
Plugin 'Yggdroot/indentLine'

call vundle#end()

" Colors
let g:onedark_termcolors=16
colorscheme onedark
set background=dark
syntax manual

" Spaces & Tabs
set nowrap
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set autoindent

autocmd BufWritePre * :%s/\s\+$//e

" UI Config
filetype plugin indent on

set number
set showcmd
set cursorline
set cursorcolumn
set wildmenu
set lazyredraw
set showmatch
set backspace=indent,eol,start
set ruler
set history=50
set hidden
set textwidth=80
set colorcolumn=+1,+41
set fillchars+=vert:│
set conceallevel=1

let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[5 q"
let &t_EI .= "\<Esc>[3 q"

function! GoToNormalMode()
        hi clear CursorLine
        hi CursorLine cterm=NONE
        hi Cursorcolumn ctermbg=8
        hi CursorLine ctermbg=8
endfunction

function! GoToInsertMode()
        hi clear CursorLine
        hi clear CursorColumn
        hi CursorLine cterm=underline
endfunction

autocmd InsertEnter * call GoToInsertMode()
autocmd InsertLeave * call GoToNormalMode()
autocmd VimLeave * let &t_SR = "\<Esc>[2 q"

set updatetime=300
au! CursorMoved * set nohlsearch
au! CursorHold * set hlsearch | let @/='\<'.expand("<cword>").'\>'
set hlsearch

set listchars=space:·
set list
highlight WhiteSpaceBol ctermfg=NONE
highlight WhiteSpaceMol ctermfg=NONE
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal syntax=ON
  autocmd WinLeave * setlocal syntax=OFF
augroup END

" Searching
set incsearch
set hlsearch
hi clear Search
hi Search ctermfg=NONE ctermbg=8

" Movement
inoremap <C-c> <esc>
nnoremap <C-c> :nohlsearch<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader=","
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"Plugins

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
set laststatus=2
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
