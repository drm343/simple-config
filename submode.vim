" add this line if did not want leave submode when type error.
let g:submode_keep_leaving_key=1

" add this line if did not want auto leave submode when timeout
let g:submode_timeout=0

" add submode
source $HOME/.config/nvim/submode/file_mode.vim
source $HOME/.config/nvim/submode/git.vim
source $HOME/.config/nvim/submode/plugin_mode.vim
