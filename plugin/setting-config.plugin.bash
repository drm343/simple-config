#!/usr/bin/env bash
setting-config() {
    editor $SIMPLE_CONFIG/config.sh
}

setting_config-menu () {
    echo -en "setting-config
" >> $SIMPLE_CONFIG/data/menu
}

setting_config-help () {
    echo "usage: source $0"
    echo ""
    echo "$0 rebuild-menu"
}


case "$1" in
    'rebuild-menu')
        setting_config-menu
        ;;
    'help')
        setting_config-help
        ;;
    *)
        ;;
esac
