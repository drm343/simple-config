THEME=easy

export PATH="$HOME/PROGRAM/bin:$SIMPLE_CONFIG/bin:$PATH"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export VIM_CONFIG="$SIMPLE_CONFIG/plugin/vim"

# use for document
export SIMPLE_CONFIG_DOC="$SIMPLE_CONFIG/doc"

# Use for desk project
export DESK_DESKS_DIR=$SIMPLE_CONFIG/desks

# Use for stow
export PROGRAM=$HOME/PROGRAM
export SOURCE=$HOME/Software/source
export PACKAGE=$HOME/Software/package
export INSTALLED=$HOME/Software/installed

# Use vi keymap for bash
set -o vi
set keymap vi-insert

# Show vi mode for bash
bind "set show-mode-in-prompt on"

# Use vi keymap for Readline
set editing-mode vi

# Force use EDITOR with vim
export EDITOR=vim

# Use for welcome message (without use motd)
# set false to close welcome message
# default: true
export WELCOME=true


# Use for tutorial message
# set false to close tutorial message
# default: true
export TUTORIAL=true
