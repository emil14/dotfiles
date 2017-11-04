if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'gioele/vim-autoswap'

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
set showcmd
set cursorline
set lazyredraw
set showmatch
set hidden
set textwidth=80
set colorcolumn=+1,+41
set fillchars+=vert:│

let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[5 q"
let &t_EI .= "\<Esc>[3 q"

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

