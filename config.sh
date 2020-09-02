# User color theme
THEME=urxvt

export PATH="$HOME/Software/installed/bin:$SIMPLE_CONFIG/bin:$PATH"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export VIM_CONFIG="$SIMPLE_CONFIG/plugin/vim"

# use for document
export SIMPLE_CONFIG_DOC="$SIMPLE_CONFIG/doc"

# Use for desk project
export DESK_DESKS_DIR=$SIMPLE_CONFIG/desks

# Force use EDITOR with vim
export EDITOR=vim

# ignore case for bash
shopt -s nocaseglob

# Use for welcome message (without use motd)
# set false to close welcome message
# default: true
export WELCOME=false

# Use for install command for DISTRO
export DISTRO=slackware

# Setup localize for DISTRO
export LOCPATH=$HOME/.locale
export LANG=zh_TW.UTF-8

# Setup less for git
export LESS=-MR
