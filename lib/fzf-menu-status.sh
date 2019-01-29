fzf-menu-next () {
    case $FZF_MENU_NUMBER in
        0)
            FZF_MENU_NUMBER=2
            ;;
        1)
            FZF_MENU_NUMBER=2
            ;;
        *)
            if $TUTORIAL; then
                FZF_MENU_NUMBER=1
            else
                FZF_MENU_NUMBER=0
            fi
            ;;
    esac
    export FZF_MENU_NUMBER
    fzf-menu-switch
}


fzf-menu-previous () {
    case $FZF_MENU_NUMBER in
        0)
            FZF_MENU_NUMBER=$FZF_MENU_LAST_NUMBER
            ;;
        1)
            FZF_MENU_NUMBER=$FZF_MENU_LAST_NUMBER
            ;;
        *)
            if $TUTORIAL; then
                FZF_MENU_NUMBER=1
            else
                FZF_MENU_NUMBER=0
            fi
            ;;
    esac
    export FZF_MENU_NUMBER
    fzf-menu-switch
}


fzf-menu-0 () {
    local command=`echo "cd-home
cd-pwd
editor-mode
project-mode
git-mode
vim-plugin-mode
reload-menu
fzf-menu-next
fzf-menu-previous" | fzf`
    $command
}


fzf-menu-1 () {
    local command=`echo "tutorial
tutorial-document
fzf-menu-next
fzf-menu-previous" | fzf`
    $command
}


fzf-menu-2 () {
    local command=`echo "setting-config
stow-mode
hello-mode
fzf-menu-next
fzf-menu-previous" | fzf`
    $command
}


fzf-menu-disable-page-0 () {
    local command=`echo "cd-home
cd-pwd
editor-mode
project-mode
git-mode
vim-plugin-mode
reload-menu
setting-config
stow-mode
hello-mode" | fzf`
    $command
}

fzf-menu-disable-page-1 () {
    local command=`echo "cd-home
cd-pwd
editor-mode
project-mode
git-mode
vim-plugin-mode
reload-menu
setting-config
stow-mode
hello-mode
tutorial
tutorial-document" | fzf`
    $command
}


fzf-menu-switch () {
    case $FZF_MENU_NUMBER in
        -1)
            fzf-menu-disable-page-0
            ;;
        -2)
            fzf-menu-disable-page-1
            ;;
        0)
            fzf-menu-0
            ;;
        1)
            fzf-menu-1
            ;;
        $FZF_MENU_LAST_NUMBER)
            fzf-menu-2
            ;;
        *)
            fzf-menu-0
            ;;
    esac
}

if $ENABLE_PAGE; then
    if $TUTORIAL; then
        FZF_MENU_NUMBER=1
    else
        FZF_MENU_NUMBER=0
    fi
else
    if $TUTORIAL; then
        FZF_MENU_NUMBER=-2
    else
        FZF_MENU_NUMBER=-1
    fi
fi
export FZF_MENU_LAST_NUMBER=2
export FZF_MENU_NUMBER
