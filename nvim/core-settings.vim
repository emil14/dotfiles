" ================================ "
" User-interface configuration
" ================================ "

" Spaces & Tabs
set wrap " this enables 'visual' wrapping
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " number of spaces to use for autoindenting
set expandtab " tabs are spaces
set smartindent " insert tabs on the start of a line according to shiftwidth, not tabstop
autocmd BufWritePre * :%s/\s\+$//e " automatically removing trailing whitespace on save

" UI
set number " show line numbers
set cursorline " highlight current line
set cursorcolumn " highlight current column
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
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase
set hlsearch " highlight search terms

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Performance improvements
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
set ttyfast

" Other
set clipboard+=unnamedplus " use system clipboard
set timeoutlen=1000 ttimeoutlen=0 " keyboard sequence react timeout
" disable netrw due to NERDTree usage
augroup goodbye_netrw
  au!
  autocmd VimEnter * silent! au! FileExplorer *
augroup END
