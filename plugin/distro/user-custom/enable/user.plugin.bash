#!/usr/bin/env bash

user.buku () {
desk run py3-user buku $*
}

user.ddgr () {
desk run py3-user ddgr $*
}

user.howdoi () {
desk run py3-user howdoi $*
}

user.fzy.menu () {
local COMMAND=$(echo -e "user.buku
user.ddgr
user.howdoi" | fzy)
$COMMAND
}

alias u=user.fzy.menu
