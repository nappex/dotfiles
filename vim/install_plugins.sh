#!/bin/sh

SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"

PLUGINS_PATH="$SCRIPT_DIR_PATH"/pack

# STATUSLINE
# if [[ ! -d $PLUGINS_PATH/statusline/start/lightline ]]
# then
#     git clone https://github.com/itchyny/lightline.vim $PLUGINS_PATH/statusline/start/lightline
# else
#     echo "lightline already installed"
# fi

# echo "export TERM=xterm-256color" >> $HOME/zshrc

# COLORS
# .vimrc file
# set "colorscheme <colorscheme_name>"
# set background=dark/ligt

# +-----------------------+
# |INSTALLATION OF PLUGINS|
# +-----------------------+

# GIT-BRANCH
if [ ! -d "$PLUGINS_PATH"/gitbranch/start/vim-gitbranch ]
then
    git clone https://github.com/itchyny/vim-gitbranch \
        "$PLUGINS_PATH"/gitbranch/start/vim-gitbranch \
    && echo "Vim plugin -> 'vim-gitbranch' installed"
else
    echo "Vim plugin -> 'vim-gitbranch' already installed"
fi

# SYNTAX HIGHLIGHTS
if [ ! -d "$PLUGINS_PATH"/hls-syntax/start/vim-polyglot ]
then
    git clone --depth 1 https://github.com/sheerun/vim-polyglot \
        "$PLUGINS_PATH"/hls-syntax/start/vim-polyglot \
    && echo "Vim plugin -> 'vim-polyglot' installed"
else
    echo "Vim plugin -> 'vim-polyglot' already installed"
fi

