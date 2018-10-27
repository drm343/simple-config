#!/usr/bin/env bash
export SIMPLE_CONFIG=$HOME/.config/simple-config
export PATH=$SIMPLE_CONFIG/bin:"$PATH"
. $SIMPLE_CONFIG/config


# Use for desk project
export DESK_DESKS_DIR=$SIMPLE_CONFIG/desks
# Load plugin for bash complete
. $SIMPLE_CONFIG/submodules/desk/shell_plugins/bash/desk

# Load lib for parameter
. $HOME/.config/simple-config/lib/dispatch.sh

# Load fzf menu
. $SIMPLE_CONFIG/lib/fzf-menu.sh

# thanks for http://simple-configrcgenerator.com/
. $SIMPLE_CONFIG/submodules/shml/shml.sh
. $SIMPLE_CONFIG/themes/$THEME
