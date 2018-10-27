# fzf-menu.sh
#
# Description: base fzf menu
#
function fzf-history () {
    history | cut -c 8- | fzf
}

function fzf-cd () {
    cd "$(find "$HOME" -type d | fzf)"
}

function fzf-cd-pwd () {
    cd "$(find "`pwd`" -type d | fzf)"
}

function git-clone-repo () {
    read -p "repo-url: " repo
    git clone $repo
}

function change-mode () {
    desk go `desk list | fzf | cut -d " " -f 1`
}

function fzf-menu () {
    local command=`echo "fzf-cd-pwd
fzf-cd
change-mode
git-clone-repo
fzf-history" | fzf`
    $command
}

alias m='fzf-menu'
