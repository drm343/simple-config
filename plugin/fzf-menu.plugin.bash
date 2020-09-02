#!/usr/bin/env bash
fzf-menu () {
    local command=`cat \
        $SIMPLE_CONFIG/data/menu \
        | fzf`

    local command_mode=`echo "$command" | grep "mode"`
    local menu_mode=`echo "$command" | grep "\.menu"`

    if [ ! -z "$command_mode" ]; then
        desk go $command_mode
    elif [ ! -z "$menu_mode" ]; then
        $(cat $SIMPLE_CONFIG/data/$menu_mode | fzy)
    else
        $command
    fi
}

alias m='fzf-menu'
