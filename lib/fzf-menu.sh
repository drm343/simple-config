# fzf-menu.sh
#
# Description: base fzf menu
#
function fzf-history () {
    history | cut -c 8- | fzf
}

function cd-home () {
    cd "$(find "$HOME" -type d | fzf)"
}

function cd-pwd () {
    cd "$(find "`pwd`" -type d | fzf)"
}

function git-mode () {
    desk go git
}

function hello-mode () {
    desk go hello
}

function vim-mode () {
    desk go vim
}

function edit-file () {
    editor $(fzf)
}

function reload-menu() {
    source ~/.bashrc
}

function fzf-menu () {
    local command=`echo "cd-home
cd-pwd
edit-file
git-mode
vim-mode
reload-menu
hello-mode
fzf-history" | fzf`
    $command
}

alias m='fzf-menu'
