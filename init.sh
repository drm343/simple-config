#!/usr/bin/env bash
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Load user config
export SIMPLE_CONFIG=$HOME/.config/simple-config
. $SIMPLE_CONFIG/config.sh

# Load user alias
. $SIMPLE_CONFIG/alias.sh

# Load plugin for bash complete
. $SIMPLE_CONFIG/submodules/desk/shell_plugins/bash/desk

# Load lib for parameter
. $SIMPLE_CONFIG/lib/dispatch.sh

# Load fzf menu
. $SIMPLE_CONFIG/lib/fzf-menu.sh

# Load enhance command for tab completion
. $SIMPLE_CONFIG/submodules/fzf-tab/bash/fzf-bash-completion.sh

# Load enhance command
. $SIMPLE_CONFIG/lib/enhance-command.sh

# thanks for http://simple-configrcgenerator.com/
. $SIMPLE_CONFIG/plugin/shml/shml.sh
#. /home/erlin/Software/source/shml/shml.sh
. $SIMPLE_CONFIG/themes/$THEME


# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
  function command_not_found_handle {
    # check because c-n-f could've been removed in the meantime
    if [ -x /usr/lib/command-not-found ]; then
      /usr/lib/command-not-found -- "$1"
      return $?
    elif [ -x /usr/share/command-not-found/command-not-found ]; then
      /usr/share/command-not-found/command-not-found -- "$1"
      return $?
    else
      printf "%s: command not found\n" "$1" >&2
      return 127
    fi
  }
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# welcome message
if $WELCOME; then
    if [ -z "$DESK_NAME" ]; then
        desk run tutorial tutorial-main-0
    fi
fi
