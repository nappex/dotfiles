# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PATH HOME TERM

export XDG_CONFIG_HOME="$HOME/.config"
export ENV=$HOME/.config/ksh/.kshrc

export PKG_PATH=https://ftp2.eu.openbsd.org/pub/OpenBSD/snapshots/packages/`uname -m`/:https://ftp.eu.openbsd.org/pub/OpenBSD/snapshots/packages/`uname -m`/

export EDITOR=/usr/local/bin/vim
