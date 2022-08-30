#!/bin/bash

PLUGINS_PATH=$HOME/.vim/pack

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
if [[ ! -d $PLUGINS_PATH/colors/start/papercolor-theme ]]
then
    git clone https://github.com/NLKNguyen/papercolor-theme.git ~/.vim/pack/colors/start/papercolor-theme
else
    echo "papercolor-theme already installed"
fi

# GIT-BRANCH
if [[ ! -d $PLUGINS_PATH/gitbranch/start/vim-gitbranch ]]
then
    git clone https://github.com/itchyny/vim-gitbranch $PLUGINS_PATH/gitbranch/start/vim-gitbranch
else
    echo "vim-gitbranch already installed"
fi

# SYNTAX HIGHLIGHTS
if [[ ! -d $PLUGINS_PATH/hls-syntax/start/vim-polyglot ]]
then
    git clone --depth 1 https://github.com/sheerun/vim-polyglot ~/.vim/pack/hls-syntax/start/vim-polyglot
else
    echo "vim-polyglot already installed"
fi

