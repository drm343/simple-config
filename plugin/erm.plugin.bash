#!/usr/bin/env bash
erm () {
    run_erm () {
        echo -ne `pwd`
        result="`ls -al | sed 1d | fzf -m --header 'Press esc, or select . to exit program'\
            | awk '{print $NF}'`"
        if [ "$result" = "." ]; then
            echo "can't remove ."
        elif [ "$result" = ".." ]; then
            echo "not select"
        elif [ -z "$result" ]; then
            echo "can't remove ."
        else
            result="`echo -n $result`"

            while true; do
                read -p "rm $result? (y/n)" yn
                case $yn in
                    [Yy]* )
                        rm $result
                        break
                        ;;
                    [Nn]* )
                        break
                        ;;
                    * )
                        echo "Please answer y/Y or n/N."
                        ;;
                esac
            done
        fi
    }

    if [ ! -z "$1" ]; then
        rm $1
    else
        run_erm
    fi
}


function erm_menu () {
    local menu="$SIMPLE_CONFIG/data/enhance-command.menu"

echo -en "erm
" >> $menu

    sort $menu | uniq > $menu.bk
    mv $menu.bk $menu
}


case "$1" in
    'rebuild-menu')
        erm_menu
        ;;
    'help')
        echo "usage: source $0"
        echo ""
        echo "usage $0 rebuild-menu"
        ;;
    *)
        ;;
esac
