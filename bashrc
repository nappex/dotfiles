# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Source aliases
[ -r "$HOME"/.config/aliasrc ] && . "$HOME"/.config/aliasrc

parse_git_branch() {
    branch_name=$(git branch --show-current 2> /dev/null)
    if [ -n "$branch_name" ]
    then
        echo "λ:$branch_name"
    else
        echo ""
    fi
}

_PS1_GREEN="\[\e[92m\]" # set fg color of prompt text to green
_PS1_BLUE="\[\e[96m\]" # set fg color of prompt text to blue
_PS1_RED="\[\e[31m\]" # set fg color of prompt text to red
_PS1_RESET="\[\e[00m\]" # reset prompt color
export PS1="$_PS1_GREEN\u@\h$_PS1_RESET:$_PS1_BLUE\w$_PS1_RESET $_PS1_RED\$(parse_git_branch)$_PS1_RESET\n\$ "

