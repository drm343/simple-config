# vim-plugin.sh
#
# Description: vim-plugin mode
#
if [ -n "`which editor`" ]; then
    alias editor=vim
fi


# this
help () {
    desk
    echo '
Use this for your vim-plug.'
}


# edit vim plugin setting
editor-plugin () {
    editor $VIM_CONFIG/load-plug.vim
}


# remove vim plugin
plugin-clean () {
    editor-plugin
    editor +PlugClean +:q +:q
}

# update vim plugin
plugin-update () {
    editor +PlugUpdate +:q +:q
}

# install vim plugin
plugin-install () {
    editor-plugin
    editor +PlugInstall +:q +:q
}

# upgrade vim-plug
upgrade () {
    editor +PlugUpgrade +:q +:q
}

# vim plugin menu
vim-plugin-menu () {
    local result=`echo "plugin-install
plugin-clean
plugin-update
upgrade
help
exit" | fzf`
    $result
}


# open menu
alias m='vim-plugin-menu'
