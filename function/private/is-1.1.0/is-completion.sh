#!/usr/bin/env bash
_is_completions ()
{
    local base_commands="equal matching substring empty number gt \
          lt ge le file dir link existing readable writeable executable \
          available older newer true false"
    local commands="$base_commands not"

    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "$commands" -- ${cur}))
            ;;
        2)
            case ${prev} in
                not)
                    COMPREPLY=($(compgen -W "$base_commands" -- ${cur}))
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac
}

complete -F _is_completions is
