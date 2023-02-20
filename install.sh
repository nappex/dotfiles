#!/bin/sh

# README
# option -s for soft link is used to be able to create link
# to directory. Hard link invoke an error in case of dir.
# option -f is used to create link on already exist file or dir.


# FUNCTIONS
Y_or_N() {
    printf "%s (y/N): " "$1"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]
    then
        return 0;
    else
        return 1;
    fi
}

# CONSTANTS
SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
CONFIG_HOME=$HOME/.config

# MAKE SOFT LINKS
DOTFILES=(
    "vim"
    "profile"
    "bashrc"
    "aliasrc"
    "zsh/zshenv"
    "git/gitconfig"
)

for path in "${DOTFILES[@]}"; do
    # get filename from path
    dotfile=$(basename "$path")
    target=$HOME/."$dotfile"
    echo $target
    if [ -e $target ]
    then
       Y_or_N "$target exists, overwrite it?" \
           && ln -sf $SCRIPT_DIR_PATH/$path $target \
           && echo "Soft link $target created successfully"
    else
        ln -s $SCRIPT_DIR_PATH/$path $target \
            && echo "Soft link $target created successfully"
    fi
done

# CONFIG_HOME/zsh = ZDOTDIR in .zshenv, dont forget any change to update .zshenv

CONFIG_DOTFILES=(
    "zsh/.zshrc"
    "zsh/.zprofile"
    "git/ignore"
)

for path in "${CONFIG_DOTFILES[@]}"; do
    # get dirname and make path to ~/.config/<dirname>
    target_dirpath=$CONFIG_HOME/"$(dirname "$path")"
    target=$CONFIG_HOME/$path
    if [ -e $target ]
    then
       Y_or_N "$target exists, overwrite it?" \
           && ln -sf $SCRIPT_DIR_PATH/$path $target \
           && echo "Soft link to $target created successfully"
    else
        mkdir -p "$target_dirpath" \
            && ln -s $SCRIPT_DIR_PATH/$path $target \
            && echo "Soft link to $target created successfully"
    fi
done


# INSTALL VIM PLUGINS
$SCRIPT_DIR_PATH/.vim/install_plugins.sh

