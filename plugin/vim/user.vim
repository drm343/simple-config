" my config "

" replace tab with 4 space if did not install supertab
set tabstop=2
set shiftwidth=2
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

" setup colorscheme, need to install syntax check plugin
syntax enable
filetype plugin on
filetype plugin indent on


" vimwiki custom
let wiki0 = {}
let wiki0.path = '~/Documents/vimwiki'

let wiki1 = {}
let wiki1.path = '~/.config/simple-config/doc'

let wiki2 = {}
let wiki2.path = '~/Documents/drm343.github.io/wiki/'
let wiki2.path_html = '~/Documents/drm343.github.io'
let wiki2.template_path = '~/Documents/drm343.github.io/templates'
let wiki2.template_default = 'default'

let g:vimwiki_list = [wiki0, wiki1, wiki2]


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


set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%{StatuslineMode()}
set statusline+=%1*
set statusline+=%y
set statusline+=%4*
set statusline+=:
set statusline+=%n
set statusline+=:
set statusline+=%5*
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=%1*
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=<
set statusline+=<
set statusline+=%.20f
set statusline+=>
set statusline+=>
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=black ctermfg=white guibg=black guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
