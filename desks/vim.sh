# vim.sh
#
# Description: vim mode
#
if [ -n "`which editor`" ]; then
    alias editor=vim
fi


# this
help () {
    desk
    echo '
Use this for your vim.'
}

# remove vim plugin
plugin-clean () {
    editor +PlugClean +:q +:q
}

# update vim plugin
plugin-update () {
    editor +PlugUpdate +:q +:q
}

# install vim plugin
plugin-install () {
    editor +PlugInstall +:q +:q
}

# upgrade vim-plug
upgrade () {
    editor +PlugUpgrade +:q +:q
}

# vim menu
vim-menu () {
    local result=`echo "plugin-install
plugin-clean
plugin-update
upgrade
help
exit" | fzf`
    $result
}


# open menu
alias m='vim-menu'
