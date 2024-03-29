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

    Remove_Local `find $SIMPLE_CONFIG/enable -type l`
    Remove_Local `find $SIMPLE_CONFIG/bin -type l`
    Remove_Local `find $SIMPLE_CONFIG/completion -type l`

    echo "You need to source follow files to uninstall all function.
Or you can create a new terminal.

source $SIMPLE_CONFIG/plugin/distro/$DISTRO/uninstall"
}

# Install distro command
Install () {
    Install_Local () {
        pushd $SIMPLE_CONFIG/$1
        local DIR_PATH=$SIMPLE_CONFIG/plugin/distro/$DISTRO

        if is existing "$DIR_PATH/$1"; then
            local CHECK_DIR=$(ls $DIR_PATH/$1)

            if is not empty "$CHECK_DIR"; then
                ln -s ../plugin/distro/$DISTRO/$1/* .
            fi
        fi
        popd
    }

    Install_Local enable

    if is existing "$SIMPLE_CONFIG/enable/$DISTRO.plugin.bash";
    then
        source $SIMPLE_CONFIG/enable/$DISTRO.plugin.bash
    fi

    Install_Local completion
    Install_Local bin
}


# this
help () {
    desk
}

# open menu
distro-menu () {
    local command=$(echo "Install
Remove
help
exit" | fzy)
    $command
}

# Alias for menu
alias m='distro-menu'
