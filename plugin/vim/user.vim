" my config "

" replace tab with 4 space if did not install supertab
set tabstop=4
set shiftwidth=4
set expandtab

" use mouse for click file
set mouse=a

" highlight search and setup comment color
set hlsearch
hi Search ctermfg=grey ctermbg=blue
hi Comment ctermfg=darkcyan


" default encoding use utf-8
set encoding=UTF-8
set fileencodings=utf8,latin1

" show line number and user can type relativenumber and jump to target line
set number
set relativenumber

" use <leader> key with space, habit from spacemacs.
let mapleader = " "

" setup colorscheme
colorscheme deep-space

" setup colorscheme, need to install syntax check plugin
syntax enable
filetype plugin indent on

" quickmenu_options
let g:quickmenu_options = "HL"
let g:quickmenu_max_width = 300


let g:vimwiki_list = [{
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default'}]

" choose backup dir for user
set backupdir=~/.local/share/trash/vim/backup
set directory=~/.local/share/trash/vim/swp
set undodir=~/.local/share/trash/vim/undo
