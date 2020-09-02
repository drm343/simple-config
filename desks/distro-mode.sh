#! distro-mode.sh
#
# Description: manager command for distro
#

# Remove distro command
Remove () {
    Remove_Local () {
        local result=$@
        for i in $result;
        do
            result=`ls -l $i | grep "$DISTRO"`;
            if [ ! -z "$result" ]; then
                rm $i;
            fi
        done
    }

    Remove_Local `find $SIMPLE_CONFIG/bin -type l`
    Remove_Local `find $SIMPLE_CONFIG/completion -type l`
}

# Install distro command
Install () {
    Install_Local () {
        pushd $SIMPLE_CONFIG/$1
        ln -s $SIMPLE_CONFIG/plugin/distro/$DISTRO/$1/* .
        popd
    }

    Install_Local completion
    Install_Local bin
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
