# Zsh Run Commnads file

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

