" fzf.vim
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible<Paste>

" ack.vim
if executable('ag') " use ag if available
  let g:ackprg = 'ag --vimgrep'
endif

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 0
autocmd VimEnter * NERDTree
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" lightline
let g:lightline = {
\   'colorscheme': 'onedark'
\ }

if !has('gui_running')
  set t_Co=256
endif

" vim-polyglot
let g:javascript_plugin_flow = 1
let g:vim_json_syntax_conceal = 0
let g:vue_disable_pre_processors=1
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

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
let g:indentLine_fileTypeExclude = ['nerdtree']
let g:indentLine_faster=1
let g:indentLine_concealcursor=''
let g:indentLine_char = '┆'
set concealcursor=ic

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

" vim-sneak
let g:sneak#label = 1 " label-mode for a minimalist alternative to EasyMotion

