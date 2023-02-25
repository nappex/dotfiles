#!/bin/sh

# README
# option -s for soft link is used to be able to create link
# to directory. Hard link invoke an error in case of dir.
# option -f is used to create link on already exist file or dir.
# option -n to not descend to directory, should be compatible


# FUNCTIONS
Y_or_N() {
    printf "%s (y/N): " "$1"
    read -r answer
    if [ "$answer" != "${answer#[Yy]}" ]
    then
        return 0;
    else
        return 1;
    fi
}

# CONSTANTS
SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit; pwd -P )"
CONFIG_HOME=$HOME/.config

# MAKE SOFT LINKS
set -- vim profile bashrc zsh/zshenv git/gitconfig

for path in "$@"
do
    # get filename from path
    dotfile=$(basename "$path")
    target=$HOME/."$dotfile"

    if [ -e "$target" ] || [ -h "$target" ]
    then
        Y_or_N "$target exists, overwrite it?" \
        && rm "$target" \
        && ln -s "$SCRIPT_DIR_PATH"/"$path" "$target" \
        && echo "Soft link $target created successfully"
    else
        ln -s "$SCRIPT_DIR_PATH"/"$path" "$target" \
        && echo "Soft link $target created successfully"
    fi
done

# CONFIG_HOME/zsh = ZDOTDIR in .zshenv, dont forget any change to update .zshenv
set -- zsh/.zshrc zsh/.zprofile aliasrc

for path in "$@"
do
    # get dirname and make path to ~/.config/<dirname>
    target_dirpath=$CONFIG_HOME/"$(dirname "$path")"
    target=$CONFIG_HOME/"$path"

    if [ -e "$target" ] || [ -h "$target" ]
    then
        Y_or_N "$target exists, overwrite it?" \
        && rm "$target" \
        && ln -s "$SCRIPT_DIR_PATH"/"$path" "$target" \
        && echo "Soft link to $target created successfully"
    else
        mkdir -p "$target_dirpath" \
        && ln -s "$SCRIPT_DIR_PATH"/"$path" "$target" \
        && echo "Soft link to $target created successfully"
    fi
done

#COPY
# ignore file is platform specific the base is copied rest must be fill by platform
source="$SCRIPT_DIR_PATH"/git/ignore
target_dir="$CONFIG_HOME"/git/
target_file="$CONFIG_HOME"/git/ignore
if [ -e "$target_file" ] || [ -h "$target_file" ]
then
    Y_or_N "$target_file exists, overwrite it?" \
    && rm "$target_file" \
    && cp "$source" "$target_file" \
    && echo "$source copied to $target_file"
else
    if [ ! -d "$target_dir" ]
    then
        mkdir -p "$target_dir"
    fi

    cp "$source" "$target_file" \
    && echo "$source copied to $target_file"
fi

# INSTALL VIM PLUGINS
"$SCRIPT_DIR_PATH"/vim/install_plugins.sh

