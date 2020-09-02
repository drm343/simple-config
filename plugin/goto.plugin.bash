#!/usr/bin/env bash
. $SIMPLE_CONFIG/lib/is.sh


function dirs_goto () {
    local target=$(find "$HOME" -type d -maxdepth 3 | fzy)

    if is dir $target; then
        pushd $target
    fi
}

function dirs_goto_pwd () {
    local target=$(find "$(pwd)" -type d -maxdepth 3 | fzy)

    if is dir "$target"; then
        pushd "$target"
    fi
}

function dirs_push () {
    pushd +$(dirs -v | fzy | awk '{print $1}')
}

function dirs_pop () {
    popd +$(dirs -v | fzy | awk '{print $1}')
}

function dirs_menu () {
echo -en "dirs_goto
dirs -v
dirs_push
dirs_pop
dirs_goto_pwd
" >> $SIMPLE_CONFIG/data/menu
}


function dirs_stop () {
    unalias dirs.print
    unalias dirs.goto
    unalias dirs.push
    unalias dirs.pop
    unalias dirs.pwd
}


alias dirs.print="dirs -v"
alias dirs.goto="dirs_goto"
alias dirs.push="dirs_push"
alias dirs.pop="dirs_pop"
alias dirs.pwd="dirs_goto_pwd"


case "$1" in
    'stop')
        dirs_stop
        ;;
    'rebuild-menu')
        dirs_menu
        ;;
    'help')
        echo "usage: source $0"
        echo ""
        echo "usage $0 stop|rebuild-menu"
        ;;
    *)
        ;;
esac
