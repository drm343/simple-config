" use vim-plug to install plugin
call plug#begin("~/.vim/my-plug")
source $VIM_CONFIG/load-plug.vim
call plug#end()

" user config
source $VIM_CONFIG/user.vim

" custom command without grouping
source $VIM_CONFIG/cmd.vim

" menu for group command
source $VIM_CONFIG/menu.vim

" load language dictionary
source $VIM_CONFIG/programming-language.vim
