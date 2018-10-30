#! hello.sh
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
    local command=`echo "hello
help
exit" | fzf`
    $command
}

# Alias for command hello
alias h='hello'

# Alias for menu
alias m='hello-menu'
