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

# edit file with vim
function edit-file () {
    local local_file=$(fzf)
    if [ -e "$local_file" ];
    then
        editor $local_file
    fi
}

# remove vim plugin
function plugin-clean () {
    editor +PlugClean +:q +:q
}

# install vim plugin
function plugin-install () {
    editor +PlugInstall +:q +:q
}

# vim menu
function vim-menu () {
    local result=`echo "edit-file
plugin-install
plugin-clean
help
exit" | fzf`
    $result
}


# open menu
alias m='vim-menu'
