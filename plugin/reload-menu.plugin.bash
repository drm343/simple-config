#!/usr/bin/env bash
reload-menu () {
    create-menu () {
        if is dir $1; then
            for i in $1/*;
            do
                if is not dir "$i"; then
                    . $i rebuild-menu
                fi
            done
        else 
            . $1
        fi
    }

    fuzzy-regen-menu () {
        # Load enhance command
        create-menu $SIMPLE_CONFIG/enable;

        result=$(ls \
            $SIMPLE_CONFIG/data/*.menu \
            $SIMPLE_CONFIG/desks/* \
            | sed "s/.*desks\/\(.*\)\.sh/\1/" \
            | sed 's/\x1b\[[0-9;]*m//g')

        echo -en "reload-menu
" >> $SIMPLE_CONFIG/data/menu

        for item in $result;
        do
            echo $(basename $item) >> $SIMPLE_CONFIG/data/menu
        done
        sort -o $SIMPLE_CONFIG/data/menu $SIMPLE_CONFIG/data/menu
    }

    unalias -a
    source ~/.bashrc

    rm $SIMPLE_CONFIG/data/menu
    fuzzy-regen-menu
}
