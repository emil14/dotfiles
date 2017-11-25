" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" use <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

" Use ALT to work with windows from any mode:
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
nnoremap <A-q> <C-w>q
nnoremap <A-s> <C-w>s
nnoremap <A-v> <C-w>v

" remap scroll keys
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>
nnoremap <C-h> <C-u>
nnoremap <C-l> <C-d>

" Leader Shortcuts
map <Space> <Leader>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq!<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>o :Files<CR>
nmap <leader>j :NERDTreeFind<CR>

" Omnicomplete Better Nav
inoremap <expr> <S-j> ("\<C-n>")
inoremap <expr> <S-k> ("\<C-p>")

" FZF
let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-s': 'split',
  \ 'alt-v': 'vsplit'}

" NERDTree
let NERDTreeMapActivateNode='l'
let NERDTreeMapJumpParent='h'
let NERDTreeMapChangeRoot='L'
let NERDTreeMapUpdir='H'
map <C-n> :NERDTreeToggle<CR>

" Vim-Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Useful EOL mappings
nnoremap Y y$
inoremap <C-Del> <C-\><C-O>D

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
