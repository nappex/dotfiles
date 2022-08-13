#!/bin/bash

PLUGINS_PATH=~/.vim/pack

# statusline
git clone https://github.com/itchyny/lightline.vim $PLUGINS_PATH/statusline/start/lightline

# echo "export TERM=xterm-256color" >> ~/.zshrc

# colorschemes, after install set .vimrc with "colorscheme <colorscheme_name>" 
git clone https://github.com/itchyny/landscape.vim.git $PLUGINS_PATH/colorschemes/start/landscape

# git clone https://github.com/tomasr/molokai.git $PLUGINS_PATH/colorschemes/start/molokai
# echo "colorscheme molokai" >> ~/.vim/vimrc

# show gitbranch
git clone https://github.com/itchyny/vim-gitbranch $PLUGINS_PATH/gitbranch/start/vim-gitbranch

# files tree
git clone https://github.com/preservim/nerdtree.git $PLUGINS_PATH/files-bar/start/nerdtree
vim -u NONE -c "helptags $PLUGINS_PATH/files-bar/start/nerdtree/doc" -c q

# surround commnad
git clone https://tpope.io/vim/surround.git  $PLUGINS_PATH/commands/start/surround
vim -u NONE -c "helptags $PLUGINS_PATH/commands/start/surround/doc" -c q

# repeat command, if we want use . with surround command
git clone https://tpope.io/vim/repeat.git $PLUGINS_PATH/commands/start/repeat

# commentary commands, commnet out/in line or block
git clone https://tpope.io/vim/commentary.git $PLUGINS_PATH/commands/start/commentary

# paste register as god, solve problem with copy paste word as yiw -> viw -> p.
# this is not repeatable the register is overwritten and process is long
# with this plugin just yiw -> griw
git clone https://github.com/vim-scripts/ReplaceWithRegister.git $PLUGINS_PATH/commands/start/ReplaceWithRegister

