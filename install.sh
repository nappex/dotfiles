#!/bin/sh

CONFIG_HOME=$HOME/.config

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

DOTFILES=(
    ".vim"
    ".profile"
)

SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Create symlinks

for dotfile in "${DOTFILES[@]}"; do
    dst=$HOME/$dotfile
    # Overwrite existing dotfile to symlink?
    # overwriting is done by option -Fh as force
    ln -sFniv $SCRIPT_DIR_PATH/$dotfile $dst
done

HOME_DOTFILES=(
    "bash/.bashrc"
    "zsh/.zshenv"
    "git/.gitconfig"
    "aliases/.aliasrc"
)

for dotpath in "${HOME_DOTFILES[@]}"; do
    dotfile="$(cut -d '/' -f 2 <<<"$dotpath")"
    dst=$HOME/"$dotfile"
    # Overwrite existing dotfile to symlink?
    # overwriting is done by option -Fh as force
    ln -sFniv $SCRIPT_DIR_PATH/$dotpath $dst
done

# CONFIG_HOME/zsh = ZDOTDIR in .zshenv, dont forget any change to update .zshenv

CONFIG_DOTFILES=(
    "zsh/.zshrc"
    "git/ignore"
)

for dotpath in "${CONFIG_DOTFILES[@]}"; do
    dst=$CONFIG_HOME/$dotpath
    # if dir not exists create it!!!!
    # overwriting is done by option -Fh as force
    ln -sFniv $SCRIPT_DIR_PATH/$dotpath $dst
done


# INSTALL VIM PLUGINS
$SCRIPT_DIR_PATH/.vim/install_plugins.sh

