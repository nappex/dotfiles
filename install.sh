#!/bin/bash

PLUGINS_PATH=$HOME/.vim/pack

# statusline
if [[ ! -d $PLUGINS_PATH/statusline/start/lightline ]]
then
    git clone https://github.com/itchyny/lightline.vim $PLUGINS_PATH/statusline/start/lightline
else
    echo "lightline already installed"
fi

# echo "export TERM=xterm-256color" >> $HOME/zshrc

# colorschemes, after install set .vimrc with "colorscheme <colorscheme_name>"
if [[ ! -d $PLUGINS_PATH/colorschemes/start/landscape ]]
then
    git clone https://github.com/itchyny/landscape.vim.git $PLUGINS_PATH/colorschemes/start/landscape
else
    echo "landscape already installed"
fi

# git clone https://github.com/tomasr/molokai.git $PLUGINS_PATH/colorschemes/start/molokai
# echo "colorscheme molokai" >> $HOME/vim/vimrc

# show gitbranch
if [[ ! -d $PLUGINS_PATH/gitbranch/start/vim-gitbranch ]]
then
    git clone https://github.com/itchyny/vim-gitbranch $PLUGINS_PATH/gitbranch/start/vim-gitbranch
else
    echo "vim-gitbranch already installed"
fi

# files tree
if [[ ! -d $PLUGINS_PATH/files-bar/start/nerdtree ]]
then
    git clone https://github.com/preservim/nerdtree.git $PLUGINS_PATH/files-bar/start/nerdtree
    vim -u NONE -c "helptags $PLUGINS_PATH/files-bar/start/nerdtree/doc" -c q
else
    echo "nerdtree already installed"
fi

# surround commnad
if [[ ! -d $PLUGINS_PATH/commands/start/surround ]]
then
    git clone https://tpope.io/vim/surround.git  $PLUGINS_PATH/commands/start/surround
    vim -u NONE -c "helptags $PLUGINS_PATH/commands/start/surround/doc" -c q
else
    echo "surround already installed"
fi

# repeat command, if we want use . with surround command
if [[ ! -d $PLUGINS_PATH/commands/start/repeat ]]
then
    git clone https://tpope.io/vim/repeat.git $PLUGINS_PATH/commands/start/repeat
else
    echo "repeat already installed"
fi

# commentary commands, commnet out/in line or block
if [[ ! -d $PLUGINS_PATH/commands/start/commentary ]]
then
    git clone https://tpope.io/vim/commentary.git $PLUGINS_PATH/commands/start/commentary
    vim -u NONE -c "helptags $PLUGINS_PATH/commands/start/commentary" -c q
else
    echo "commentary already installed"
fi

# paste register as god, solve problem with copy paste word as yiw -> viw -> p.
# this is not repeatable the register is overwritten and process is long
# with this plugin just yiw -> griw
if [[ ! -d $PLUGINS_PATH/commands/start/ReplaceWithRegister ]]
then
    git clone https://github.com/vim-scripts/ReplaceWithRegister.git $PLUGINS_PATH/commands/start/ReplaceWithRegister
else
    echo "ReplaceWithRegister already installed"
fi

if [[ ! -d $PLUGINS_PATH/lang-support/start/vim-elixir ]]
then
    git clone https://github.com/elixir-editors/vim-elixir.git ~/.vim/pack/lang-support/start/vim-elixir
else
    echo "vim-elixir already installed"
fi

