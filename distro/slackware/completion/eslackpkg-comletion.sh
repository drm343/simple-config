#!/usr/bin/env bash
_eslack_completions ()
{
    local commands="find check remove requires download build install all help version"
    local subcommands_select="current select"

    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "$commands" -- ${cur}))
            ;;
        2)
            case ${prev} in
                remove)
                    COMPREPLY=($(compgen -W "$subcommands_select" -- ${cur}))
                    ;;
                version)
                    COMPREPLY=($(compgen -W "$subcommands_select" -- ${cur}))
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac

}

complete -F _eslack_completions eslackpkg
