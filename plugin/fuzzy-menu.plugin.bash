#!/usr/bin/env bash
fuzzy-menu () {
    local command=$(cat $SIMPLE_CONFIG/data/menu \
        | fzy)

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

alias m='fuzzy-menu'
