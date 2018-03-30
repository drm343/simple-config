" use vim-plug to install plugin
call plug#begin("~/.vim/my-plug")
source $HOME/.config/nvim/load-plug.vim
call plug#end()

" custom command without grouping
source $HOME/.config/nvim/cmd.vim

" user config
source $HOME/.config/nvim/user.vim

" submode for group command
source $HOME/.config/nvim/submode.vim

" load language dictionary
source $HOME/.config/nvim/programming-language.vim
