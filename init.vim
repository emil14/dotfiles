" Vim-Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

hi VertSplit guifg=#4b5263

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

" open new splits on the right or on the bottom of the screen
set splitbelow
set splitright

" hide the sign on blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" highlight matches
set updatetime=300
au! CursorMoved * set nohlsearch
au! CursorHold * set hlsearch | let @/='\<'.expand("<cword>").'\>'

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

" terminal mappings
tnoremap <Esc> <C-\><C-n> " ap <Esc> to exit terminal-mode

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" Leader Shortcuts
let mapleader="," " leader is comma
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
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
let NERDTreeMapActivateNode='l'
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction<Paste>

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

" vim-autoswap
set title titlestring= " enable the title option

" vim-diminactive
let g:diminactive_use_syntax = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vue_disable_pre_processors=1 " disable checking for prepocessors

set synmaxcol=128
syntax sync minlines=256

set clipboard=unnamed
