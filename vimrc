if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'joshdick/onedark.vim'

call plug#end()

runtime plugin/sensible.vim

set wrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

autocmd BufWritePre * :%s/\s\+$//e

set number
set relativenumber
set showcmd
set cursorline
set lazyredraw
set showmatch
set hidden
set textwidth=80
set colorcolumn=+1,+41
set fillchars+=vert:│
hi CursorLine cterm=NONE ctermbg=8

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set backspace=indent,eol,start
set ignorecase
set smartcase
set hlsearch

nnoremap j gj
nnoremap k gk

let mapleader=","

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set title titlestring=

let g:onedark_terminal_italics=1

if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark

