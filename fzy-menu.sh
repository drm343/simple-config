#!/usr/bin/env bash
function fzy-history () {
    history | cut -c 8- | fzy
}

function fzy-cd () {
    cd "$(find $HOME -type d | fzy)"
}

function fzy-git () {
    `cat $HOME/.config/simple-config/git-command | fzy`
}

function git-clone-repo () {
    read -p "repo-url: " repo
    git clone $repo
}

function fzy-menu () {
    `cat $HOME/.config/simple-config/command | fzy`
}
