#!/usr/bin/env bash
_eslack_completions ()
{
    local commands="find check remove requires download build install all help version auto-version auto-install"
    local subcommands_remove="current select"
    local subcommands_download="auto select"
    local subcommands_version="from select"

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
                    COMPREPLY=($(compgen -W "$subcommands_remove" -- ${cur}))
                    ;;
                download)
                    COMPREPLY=($(compgen -W "$subcommands_download" -- ${cur}))
                    ;;
                version)
                    COMPREPLY=($(compgen -W "$subcommands_version" -- ${cur}))
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac

}

complete -F _eslack_completions eslackpkg
