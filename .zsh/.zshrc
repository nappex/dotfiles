# Zsh Run Commnads file

# OPTIONS

# option multios duplicate streams of file descriptors, if we redirect stdout or
# stderr we can still pipe these outputs because of their duplication.
# ls >/dev/null | cat, cat still read the output
# MULTIOS is enabled by default
unsetopt multios


#ALIASES
# Load aliases from file
# https://zsh.sourceforge.io/Guide/zshguide02.html#l22
# https://zsh.sourceforge.io/Guide/zshguide03.html#l41
#
# checks if there is a readable file ~/.aliasrc, and if there is,
# it runs it in exactly the same way the normal startup files are run.
# You can use `source' instead of `.' if it means more to you;
# `.' is the traditional Bourne and Korn shell name, however

# -r FILE: True if the file exists and is readable
if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

# CUSTOMIZE PROMPT

PS1='[%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info)]
%# '

