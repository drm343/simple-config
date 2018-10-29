let g:menus = {}
source $VIM_CONFIG/menu/file_mode.vim
source $VIM_CONFIG/menu/quickfix_mode.vim
call denite#custom#var('menu', 'menus', g:menus)
