#!/usr/bin/env bash
ecd () {
    run_ecd () {
        echo -ne $(pwd)
        result="$(ls -al | sed 1d |
            fzy -p 'Press esc, or select . to exit program > ' |
            sed 's/\x1b\[[0-9;]*m//g' | # remove color control code
            awk '{print $NF}')"

        if [ "$result" = "." ]; then
            result=""
        fi
    }

    if [ ! -z "$1" ]; then
        cd $1
    else
        run_ecd

        while [ ! -z "$result" ]; do
            cd $result
            run_ecd
        done;
    fi
}


ecd-up () {
    if is not empty $1; then
        if is gt $1 1;then
            for i in $(seq 1 $1);
            do
                cd ..
            done
        fi
    else
        cd ..
    fi
}


ecd_stop () {
    unalias ..
}

ecd_menu () {
    local menu="$SIMPLE_CONFIG/data/enhance-command.menu"

echo -en "ecd
" >> $menu

    sort $menu | uniq > $menu.bk
    mv $menu.bk $menu
}


case "$1" in
    'stop')
        ecd_stop
        ;;
    'rebuild-menu')
        ecd_menu
        ;;
    'help')
        echo "usage: source $0"
        echo ""
        echo "usage $0 stop|rebuild-menu"
        ;;
    *)
        alias ..='ecd-up'
        ;;
esac
