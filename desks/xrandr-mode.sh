#! xrandr-mode.sh
#
# Description: xrandr change screen mode
#

# Switch screen with xrandr
xrandr-switch () {
    $(ls ~/.screenlayout/* | fzy)
}

# this
help () {
    desk
}


# open menu
xrandr-menu () {
    local command=$(echo "xrandr-switch
xrandr
help
exit" | fzy)
    $command
}

# Alias for menu
alias m='xrandr-menu'
