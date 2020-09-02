#!/usr/bin/env bash

_trash_completions ()
{
    local commands="vim-backup clear remove help"
    local files="$(find . -type f -maxdepth 1)"
    local cur prev

    COMPREPLY=($(compgen -W "$commands" -- "${COMP_WORDS[1]}"))


    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "$commands" -- ${cur}))
            ;;
        2)
            case ${prev} in
                remove)
                    COMPREPLY=($(compgen -W "$files" -- ${cur}))
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            ;;
    esac
}

complete -F _trash_completions trash
