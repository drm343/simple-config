if !exists("$VIM_CONFIG")
    let $SIMPLE_CONFIG="\$HOME/.config/simple-config"
    let $SIMPLE_CONFIG_DOC="\$SIMPLE_CONFIG/doc"
    let $VIM_CONFIG="\$SIMPLE_CONFIG/plugin/vim"
endif
source $VIM_CONFIG/init.vim
