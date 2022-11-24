# Dotfiles

Portable version of my all dotfiles. So far it handles dotfiles
for `zsh`, `bash`, `git`, `vim`.


## Installation

You should install all applications which are related to dotfiles.

### DEBIAN/UBUNTU

```
sudo apt update && sudo apt upgrade
sudo apt install vim-gtk zsh bash git
```

### Arch

```
sudo pacman -Syu
sudo pacman -S vim zsh bash git
```
Vim is without support of GTK/X, e.g. `+clipboard` is missing.
If you want `vim` with support GTK/X, you have to instal `gvim`. Unfortunately all dotfiles
are written for `vim` so you will have to tweak some files to update for `gvim`.

Check [Arch documentation](https://wiki.archlinux.org/title/Vim#Installation)

### macOS (with brew)

```
brew update && brew upgrade
brew install vim zsh bash git
```

### Install Script

It just install dotfiles eventually packages needed for purpuse of particular dotfile (e.g. vim).

You can install all dotfiles by script `install.sh`.

```sh
./install.sh
```

It may be necessary to make the file executable by:

```sh
sudo chmod u+x install.sh
```

Installation script take argument for shell, you can install just `zsh` or `bash`. If you
don't specify both of them will be installed.

## Vim
More information about vim configuration find [here](.vim/README.md)

## Zsh

If you want to try ZSH without any configuration invoke `zsh -f`, option `-f` means option NO_RCS.

### Where to find information

- Run manual pages `man zshall`
- Explore [Official guide](https://zsh.sourceforge.io/Guide/zshguide.html)
- Some settings are nicely described in this [blog](https://thevaluable.dev/zsh-install-configure-mouseless/)

## Bash

### Customize Bash prompt

If you'd like to customize prompt you have to change variable PS1.

Links:
If you'd like to learn how to customize looks of your bash, check links below.

1. https://tynick.com/blog/06-12-2019/how-to-change-your-ps1-bash-prompt-and-add-emojis/
2. http://jafrog.com/2013/11/23/colors-in-terminal.html

## Git

