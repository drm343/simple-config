let g:menus = {}
source $HOME/.config/nvim/menu/file_mode.vim
source $HOME/.config/nvim/menu/plugin_mode.vim
source $HOME/.config/nvim/menu/quickfix_mode.vim
call denite#custom#var('menu', 'menus', g:menus)
