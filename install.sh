#!/bin/sh

CONFIG_HOME=$HOME/.config

Y_or_N() {
    printf "%s (y/N): " $1
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]
    then
        return 0;
    else
        return 1;
    fi
}

DOTFILES=(
    ".vim"
    ".profile"
    ".bashrc"
    ".aliasrc"
    ".gitconfig"
)

SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"


# Create symlinks

for dotfile in "${DOTFILES[@]}"; do
    dst=$HOME/$dotfile
    if [ -f $dst ]
    then
        # Overwrite existing dotfile to symlink?
        # overwriting is done by option -f as force
        echo "$dst already exist!"
        Y_or_N "Do you want to overwrite" \
            && ln -sf $SCRIPT_DIR_PATH/$dotfile $dst \
            && echo "$dst was overwrited as symlink."
    else
        ln -s $SCRIPT_DIR_PATH/$dotfile $dst \
            && echo "New symlink $dst was created."
    fi
done

ln -s $SCRIPT_DIR_PATH/zsh/.zshenv $HOME/.zshenv
# it is same as ZDOTDIR in .zshenv, dont forget any change to update .zshenv
ln -s $SCRIPT_DIR_PATH/zsh/.zshrc $CONFIG_HOME/zsh/.zshrc

ln -s $SCRIPT_DIR_PATH/git/ignore $CONFIG_HOME/git/ignore

# INSTALL VIM PLUGINS
$SCRIPT_DIR_PATH/.vim/install_plugins.sh
