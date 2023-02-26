export PAGER=less
#export LESS='-iMRS -x2'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1

HISTFILE=$HOME/.config/ksh/.ksh_history
HISTSIZE=20000

[ -r $HOME/.config/aliasrc ] && . $HOME/.config/aliasrc

parse_git_branch() {
  branch_name=$(git branch --show-current 2> /dev/null)
    if [ -n "$branch_name" ]
    then
        echo "λ:$branch_name"
    else
        echo ""
    fi
}

PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\e[31m\]\$(parse_git_branch)\[\e[00m\]\n\$ "

