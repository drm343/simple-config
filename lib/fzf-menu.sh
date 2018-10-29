# fzf-menu.sh
#
# Description: base fzf menu
#
function fzf-history () {
    history | cut -c 8- | fzf
}

function fzf-cd-home () {
    cd "$(find "$HOME" -type d | fzf)"
}

function fzf-cd-pwd () {
    cd "$(find "`pwd`" -type d | fzf)"
}

function git-mode () {
    desk go git
}

function hello-mode () {
    #`desk list | fzf | cut -d " " -f 1`
    desk go hello
}

function edit-file () {
    editor $(fzf)
}

function reload-menu() {
    source ~/.bashrc
}

function fzf-menu () {
    local command=`echo "fzf-cd-pwd
fzf-cd-home
edit-file
git-mode
reload-menu
hello-mode
fzf-history" | fzf`
    $command
}

alias m='fzf-menu'
