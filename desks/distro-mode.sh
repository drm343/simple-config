#! distro-mode.sh
#
# Description: manager command for distro
#
. $SIMPLE_CONFIG/lib/is.sh


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

    source $SIMPLE_CONFIG/plugin/distro/$DISTRO/uninstall
    Remove_Local `find $SIMPLE_CONFIG/enable -type l`
    Remove_Local `find $SIMPLE_CONFIG/bin -type l`
    Remove_Local `find $SIMPLE_CONFIG/completion -type l`
}

# Install distro command
Install () {
    Install_Local () {
        pushd $SIMPLE_CONFIG/$1
        if is existing "$SIMPLE_CONFIG/plugin/distro/$DISTRO/$1"; then
            ln -s ../plugin/distro/$DISTRO/$1/* .
        fi
        popd
    }

    Install_Local enable
    source $SIMPLE_CONFIG/enable/$DISTRO.plugin.bash
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
