#!/usr/bin/env bash
function els () {
    run_els () {
        result="`ls -d $1/* | fzf --preview '
        if is file {}; then
            cat {};
        elif is dir {}; then
            echo "dir {}";
        else
            echo "what is {}?"
        fi'`"
    }

    if [ ! -z "$1" ]; then
        run_els $1
    else
        run_els .
    fi

    if is exist $result; then
        echo $result
    fi
}

echo -en "els" >> $SIMPLE_CONFIG/data/enhance-command.menu
