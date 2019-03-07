#!/usr/bin/env bash

_trash_completions ()
{
    COMPREPLY=($(compgen -W "vim-backup" -- "${COMP_WORDS[1]}"))
}

complete -F _trash_completions trash
