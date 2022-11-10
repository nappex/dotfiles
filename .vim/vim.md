# vim-setup

# File browsing
Use builtin netrw instead of NERDTree.
For details check `:help netrw` or `:help netrw-browse-maps`

# Statusline
Vim gives you a option to setup your own statusline check the vimrc file.

# Colors
Plugin PaperColor is used as colorscheme.

# Git
There is a plugin for show git branch in statusline.
https://github.com/itchyny/vim-gitbranch
Itchyny make wonderful plugins which are really simple and auditable.

# Highlight Syntax
There is a plugin polyglot in use because of missing elixir syntax by default.
https://github.com/sheerun/vim-polyglot

There is also plugin `vim-elixir`, but I can not install it.

# Highlight trailing whitespaces
Highlighting is made by myself. Solution for highlight and remove trailing whitespaces
by command was created thanks links below:

- https://vim.fandom.com/wiki/Highlight_unwanted_spaces
- https://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
- https://superuser.com/questions/211916/setting-up-multiple-highlight-rules-in-vim
- https://superuser.com/questions/921920/display-trailing-spaces-in-vim

When you want to remove all trailing whitespaces in file invoke in command mode
`:call TrimWhiteSpaces()`

# Requirements
Vim must be compliled with options +python3 +eval +insert_expand.
If you want to check if your version is compiled by these, then invoke in shell
`vim --version` or in vim `:ve`
