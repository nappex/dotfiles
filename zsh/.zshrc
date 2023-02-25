# Zsh Run Commnads file

# OPTIONS

# option multios duplicate streams of file descriptors, if we redirect stdout or
# stderr we can still pipe these outputs because of their duplication.
# ls >/dev/null | cat, cat still read the output
# MULTIOS is enabled by default
unsetopt multios
setopt autocd

bindkey -e

# +-------+
# |ALIASES|
# +-------+

# Load aliases from file
# https://zsh.sourceforge.io/Guide/zshguide02.html#l22
# https://zsh.sourceforge.io/Guide/zshguide03.html#l41
#
# checks if there is a readable file ~/.aliasrc, and if there is,
# it runs it in exactly the same way the normal startup files are run.
# You can use `source' instead of `.' if it means more to you;
# `.' is the traditional Bourne and Korn shell name, however

# -r FILE: True if the file exists and is readable
if [[ -r "$HOME"/.config/aliasrc ]]; then
    . "$HOME"/.config/aliasrc
fi

# +----------------+
# |CUSTOMIZE PROMPT|
# +----------------+

prompt_git_status () {
    local NOT_COMMITED=$( git status --porcelain 2>/dev/null )
    if [ -z ${NOT_COMMITED} ]
    then
        STATUS=""
    else
        STATUS="*"
    fi
}

setopt prompt_subst # If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts
autoload -Uz vcs_info # enable vcs_info (version control system - info)
zstyle ':vcs_info:*' enable git
# :vcs_info:vcs-string:user-context:repo-root-name -> format from documentation
zstyle ':vcs_info:git:*' formats ' %F{yellow}λ:%f%F{magenta}%b%f' # set the style (look) of vcs_info, it should be λ:main
zstyle ':vcs_info:git:*' use-simple true
zstyle ':vcs_info:*+*:*' debug false # If you need debug behaviour of vcs_info switch to true
precmd () {
    vcs_info
    prompt_git_status
} # always load before displaying the prompt
#${vcs_info_msg_0_} print this var you will get the result


NEWLINE=$'\n'
# RPS1='${vcs_info_msg_0_}' # right side of prompt
PS1='%F{green}%n%f@%F{green}%m%f:%F{cyan}%~%f${vcs_info_msg_0_}${STATUS}${NEWLINE}%# '

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# +----------------+
# |COMMANDS HISTORY|
# +----------------+

HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=1000
SAVEHIST=1000

