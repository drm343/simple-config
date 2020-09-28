#! hello-mode.sh
#
# Description: hello example
#

# Show hello to screen
hello () {
    echo "hello"
}

# this
help () {
    desk
}

# open menu
hello-menu () {
    local command=$(echo "hello
help
exit" | fzy)
    $command
}

# Alias for command hello
alias h='hello'

# Alias for menu
alias m='hello-menu'
