#!/usr/bin/env bash
_eslack_completions ()
{
    local commands="package remove requires download build install all help package-version"
    local subcommands_remove="current select"
    local subcommands_download="auto check"
    local subcommands_package="find view"

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
                package)
                    COMPREPLY=($(compgen -W "$subcommands_package" -- ${cur}))
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac

}

complete -F _eslack_completions eslackpkg
