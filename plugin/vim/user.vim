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
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')


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
