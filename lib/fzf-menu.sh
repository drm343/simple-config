# fzf-menu.sh
#
# Description: base fzf menu
#
fzf-history () {
    history | cut -c 8- | fzf
}

cd-home () {
    cd "$(find "$HOME" -type d | fzf)"
}

cd-pwd () {
    cd "$(find "`pwd`" -type d | fzf)"
}

git-mode () {
    desk go git
}

hello-mode () {
    desk go hello
}

vim-plugin-mode () {
    desk go vim-plugin
}

stow-mode () {
    desk go stow
}


# use custom vim editor
editor-mode () {
    editor -S `find $VIM_CONFIG/session/* | sed "/.*\x.vim/d" | fzf`
}


# use custom vim editor
project-mode () {
    editor -S `find ~ -name Project.vim | fzf` `pwd`
}


reload-menu() {
    source ~/.bashrc
}


tutorial() {
    desk run tutorial tutorial-main-1
}


tutorial-document() {
    desk run tutorial document
}


setting-config() {
    editor $SIMPLE_CONFIG/config.sh
}


fzf-menu () {
    if $TUTORIAL; then
        local command=`echo "cd-home
cd-pwd
editor-mode
project-mode
git-mode
vim-plugin-mode
reload-menu
stow-mode
hello-mode
fzf-history
setting-config
tutorial
tutorial-document" | fzf`
    else
        local command=`echo "cd-home
cd-pwd
editor-mode
project-mode
git-mode
vim-plugin-mode
reload-menu
stow-mode
hello-mode
fzf-history
setting-config" | fzf`
    fi
    $command
}

alias m='fzf-menu'
