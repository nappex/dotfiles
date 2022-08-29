set nocompatible
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
set listchars=space:·
set list
"   to show status line
set laststatus=2

" statusline created just with vim syntax without external plugin
set statusline=
set statusline+=\ [%n] "  Buffer number
set statusline+=\ %f
set statusline+=\ [%{gitbranch#name()}]
set statusline+=\ %m%r%h%w
set statusline+=%=
set statusline+=%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ (%p%%)

" Enable syntax highlighting
syntax on
" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on
set background=dark
colorscheme PaperColor

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap ` ``<left>

" enable Shift-Tab to move line by Tab back
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

"   Highlight trailing whitespace
"   https://vim.fandom.com/wiki/Highlight_unwanted_spaces
"   https://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
"   https://superuser.com/questions/211916/setting-up-multiple-highlight-rules-in-vim
"   https://superuser.com/questions/921920/display-trailing-spaces-in-vim
highlight TrailingWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=red guibg=red
" Show trailing whitespace regex \s\+$
call matchadd("TrailingWhitespace", '\s\+$')
autocmd BufWinEnter * call matchadd("TrailingWhitespace", '\s\+$')
autocmd BufWinLeave * call clearmatches()

"   remove trailing whitespaces by :call TrimWhitespaces()
fun! TrimWhiteSpaces()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Plugins

" NERDTree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

