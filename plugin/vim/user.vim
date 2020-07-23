" my config "

" replace tab with 4 space if did not install supertab
set tabstop=4
set shiftwidth=4
set expandtab

" ignore case
set ignorecase
set smartcase

" use mouse for click file
set mouse=a

" highlight search and setup comment color
set hlsearch
hi Search ctermfg=grey ctermbg=blue
hi Comment ctermfg=darkcyan

" set auto loadview and mkview
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" default encoding use utf-8
set encoding=UTF-8
set fileencodings=utf8,latin1

" use bashrc for gvim
set shellcmdflag=-c

" show line number and user can type relativenumber and jump to target line
set number
set relativenumber

" set font size for gvim
set guifont=Monospace\ 28

" use <leader> key with space, habit from spacemacs.
let mapleader = " "

" setup colorscheme
colorscheme deep-space

" setup colorscheme, need to install syntax check plugin
syntax enable
filetype plugin on
filetype plugin indent on


" vimwiki custom
let g:vimwiki_list = [{
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default'}]


let g:vimwiki_diary_months = {
      \ 1: '01', 2: '02', 3: '03',
      \ 4: '04', 5: '05', 6: '06',
      \ 7: '07', 8: '08', 9: '09',
      \ 10: '10', 11: '11', 12: '12'
      \ }


" disable default vimwiki leader keymap for speed up open vimwiki menu
let g:vimwiki_map_prefix = '<F13>'


" choose backup dir for user
set backupdir=~/.local/share/trash/vim/backup
set directory=~/.local/share/trash/vim/swp
set undodir=~/.local/share/trash/vim/undo

" For autocomplete file and vim menu
set path+=**
set wildmenu
set cpo-=<
set wcm=<C-Z>
set guioptions+=M


augroup VIMRC
  autocmd!

  autocmd BufLeave *.c   normal! mC
  autocmd BufLeave *.h   normal! mH
  autocmd BufLeave *.vim normal! mV
augroup END
