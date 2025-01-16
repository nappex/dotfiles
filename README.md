# Dotfiles

Portable version of my all dotfiles. So far it handles dotfiles
for `zsh`, `bash`, `git`, `vim`.


## Installation

You should install all applications which are related to dotfiles.

### Debian/Ubuntu

```
sudo apt update && sudo apt upgrade
sudo apt install vim-gtk zsh bash git
```

### Arch

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

Installing process create symlinks of dotfiles to your system. If file or directory already exist you will be prompt if are you sure to overwrite existing one.
Creating symlinks with option -F, -i and -v cannot be used because of problem with compatibility. Script is not portable then.
Options -h resp. -n should not be used because of problematic compatibility, said by manual page. 
I used -f option to solve problem with existing link or file.
It will create soft links because hard link can not be done on directory.


Installation script take argument for shell, you can install just `zsh` or `bash`. If you
don't specify both of them will be installed.

## Vim
More information about vim configuration find [here](.vim/README.md)

## SSH

There is configuration file for ssh. This file is not copied by installation script because
configuration is privacy and really personal thing. This file is just an example of github usage.
SSH config file should be located at `~/.ssh/config`. The `ssh-agent` must be running,
otherwise you will have to prompt password everytime. For more information check man pages
`ssh_config`.
You do not have to handle `ssh-add` command to add your key to `ssh-agent` if ssh config file
is used. It has advantage of writing password just when you use the key. Adding itself by `ssh-add`
needs the password.

If you are using tty which set `TERM` env variable, you can have a problem with `ssh`.
`SSH` looks at the var and if the var is not recognized, then `ssh` not work properly.
That is the reason why you can have a problem with `ghostty`, which set `TERM` to `xterm- ghostty`.
This type of tty is not recgnized by `ssh`. Solution is to set `TERM` variable to general value `xterm-256color`.

## Zsh

If you want to try ZSH without any configuration invoke `zsh -f`, option `-f` means option NO_RCS.

### Version control system

If you want to load information from version control system, e.g. git, you can use tool in zsh called `vcs_info`.

Sometimes you may receive an error to use `vcs_info`. Try to check or install package `zsh-vcs`,
e.g. for Alpine Linux `apk add zsh-vcs`.

For more information how to get vcs info and customize the return value for purpose of prompt you can check [offical docs](https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information)

### HomeBrew

Path to homebrew is added by default in file `$ZDOTDIR/.zprofile`. If you want to disable just comment it or delete the line in the file.

### Where to find information

- Run manual pages `man zshall`
- Explore [Official guide](https://zsh.sourceforge.io/Guide/zshguide.html)
- Some settings are nicely described in this [blog](https://thevaluable.dev/zsh-install-configure-mouseless/)

## Bash

### Customize Bash prompt

If you'd like to customize prompt you have to change variable PS1.

Links:
If you'd like to learn how to customize looks of your bash, check links below.

1. https://tynick.com/blog/06-12-2019/how-to-change-your-ps1-bash-prompt-and-add-emojis/
2. http://jafrog.com/2013/11/23/colors-in-terminal.html

## Git

