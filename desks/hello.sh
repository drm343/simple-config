#! hello.sh
#
# Description: hello example
#

# Loads the dispatch library
. $SIMPLE_CONFIG/lib/hello-menu


# Show hello to screen
hello () {
    echo "hello"
}

# Alias for command hello
alias h='hello'
