#!/bin/sh

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
    ".config/git/ignore"
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

source $SCRIPT_DIR_PATH/zsh/.zshenv
ln -s $SCRIPT_DIR_PATH/zsh/.zshenv $HOME/.zshenv
ln -s $SCRIPT_DIR_PATH/zsh/.zshrc $ZDOTDIR/.zshrc
echo ZDOTDIR=$ZDOTDIR

# INSTALL VIM PLUGINS
$SCRIPT_DIR_PATH/.vim/install_plugins.sh
