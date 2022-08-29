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
"   Search down in to sub-folders
"   Providse TAB-completion for all file-related tasks
set path+=**

"   Display all matching files when we TAB complete
set wildmenu

" Enable syntax highlighting
syntax on
" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on
set background=dark
colorscheme PaperColor

" statusline created just with vim syntax without external plugin
set laststatus=2 "   to show status line
set statusline=
set statusline+=%1*\ [%n]                "  Buffer number
set statusline+=\ %*
set statusline+=\ %f\ 
set statusline+=%2*\%m%r%h%w%*
set statusline+=%=
set statusline+=%3*\ %{gitbranch#name()}\ %*
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ (%p%%)

highlight User1 ctermbg=yellow guibg=yellow ctermfg=black guifg=black
highlight User2 ctermbg=red guibg=red
highlight User3 ctermfg=magenta guifg=magenta

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

