" ================================ "
" Plugins settings
" ================================ "

" fzf.vim
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible<Paste>

" ack.vim
if executable('ag') " use ag if available
  let g:ackprg = 'ag --vimgrep'
endif

" NERDTree
let NERDTreeMapActivateNode='l'
let NERDTreeShowHidden=1
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
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

" vim-polyglot
let g:javascript_plugin_flow = 1
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

" vim-sneak
let g:sneak#label = 1 " Try label-mode for a minimalist alternative to EasyMotion

