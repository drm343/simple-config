#! distro-mode.sh
#
# Description: manager command for distro
#

# Remove distro command
Remove () {
    local result=`find $SIMPLE_CONFIG/bin -type l`
    for i in $result;
    do
        result=`ls -l $i | grep "$DISTRO"`;
        if [ ! -z "$result" ]; then
            rm $i;
        fi
    done
}

# Install distro command
Install () {
    pushd $SIMPLE_CONFIG/bin
    ln -s $SIMPLE_CONFIG/distro/$DISTRO/* .
    popd
}


# this
help () {
    desk
}

# open menu
distro-menu () {
    local command=`echo "Install
Remove
help
exit" | fzf`
    $command
}

# Alias for menu
alias m='distro-menu'
