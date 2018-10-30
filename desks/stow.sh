# stow.sh
#
# Description: stow menu for your application build from source
#

# this
help () {
    desk
    echo '
Install or Remove package by stow.'
}


# install package from $PACKAGE
function stow-add () {
    local install_package=`ls $PACKAGE | fzf`
    if [ -n "$install_package" ];
    then
        stow -d $PACKAGE -t $PROGRAM -S $install_package
        cd $INSTALLED && ln -s $PACKAGE/$install_package .
    fi
    echo $install_package
}


# remove installed package
function stow-remove () {
    local remove_package=`ls $INSTALLED | fzf`
    stow -d $PACKAGE -t $PROGRAM -D $remove_package
    cd $INSTALLED && rm $remove_package
}


# show installed package
function stow-installed () {
    ls $INSTALLED | fzf
}


# open menu
function stow-menu () {
    local result=`echo "stow-add
stow-remove
stow-installed
help
exit" | fzf`
    $result
}


# Alias for menu
alias m='stow-menu'
