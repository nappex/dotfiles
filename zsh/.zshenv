# Contain user’s environment variables

if [ ! $XDG_CONFIG_HOME ]; then
    export ZDOTDIR="$HOME/.config/zsh"
else
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi


export HISTFILE="$ZDOTDIR/.histfile"    # History filepath
export HISTSIZE=1000                    # Maximum events for internal history
export SAVEHIST=1000                    # Maximum events in history file

