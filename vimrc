set number relativenumber
set belloff=all
set encoding=utf-8
set autoindent 
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set colorcolumn=90
set encoding=utf-8
set display=lastline
set showcmd
set incsearch
set clipboard=unnamed
set scrolloff=10
set sidescroll=5

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" enable Shift-Tab to move line by Tab back
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d> 

syntax on
colorscheme landscape

filetype plugin indent on

" Plugins

" statusline lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" NERDTree
" open NERDTree

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

