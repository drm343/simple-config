#!/usr/bin/env bash
fzf-menu2 () {
    local command=`cat \
        $SIMPLE_CONFIG/data/menu \
        | fzf`

    local command_mode=`echo "$command" | grep "mode"`

    if [ ! -z "$command_mode" ]; then
        desk go $command_mode
    else
        $command
    fi
}
