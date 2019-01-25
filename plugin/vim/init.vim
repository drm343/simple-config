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

" load start screen
source $VIM_CONFIG/start-screen.vim
