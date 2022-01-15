" setup runtime search path
set packpath+=$SIMPLE_CONFIG/submodules

" user config
source $VIM_CONFIG/user.vim

" custom command without grouping
source $VIM_CONFIG/cmd.vim

" menu for group command
source $VIM_CONFIG/menu.vim

" load start screen
"source $VIM_CONFIG/start-screen.vim

if filereadable("vimrc")
    source vimrc
endif
