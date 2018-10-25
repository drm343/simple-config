#!/usr/bin/env bash

THEME=easy

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

. $HOME/.config/simple-config/fzy-menu.sh
. $HOME/.config/simple-config/bash_aliases.sh

# thanks for http://simple-configrcgenerator.com/
. $HOME/.config/simple-config/themes/$THEME
