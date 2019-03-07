#!/usr/bin/env bash
# Load user config
export SIMPLE_CONFIG=$HOME/.config/simple-config
. $SIMPLE_CONFIG/config.sh

# Load user alias
. $SIMPLE_CONFIG/alias.sh

# Load plugin for bash complete
. $SIMPLE_CONFIG/submodules/desk/shell_plugins/bash/desk

# Load fzf menu
. $SIMPLE_CONFIG/lib/fzf-menu-2.sh

# Load enhance command
for i in $SIMPLE_CONFIG/function/*;
do
    . $i
done

# thanks for http://simple-configrcgenerator.com/
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
load-complete

# welcome message
if $WELCOME; then
    if [ -z "$DESK_NAME" ]; then
        desk run tutorial-mode tutorial-main-0
    fi
fi
