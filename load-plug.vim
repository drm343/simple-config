" a best file explorer in vim
Plug 'jeetsukumaran/vim-filebeagle'

" status bar
Plug 'vim-airline/vim-airline'

" colorschemes
Plug 'rafi/awesome-vim-colorschemes'

" language plugin
"
" complete file
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" a good ui for command, file search and open
Plug 'Shougo/denite.nvim'

" use tab for complete
Plug 'ervandew/supertab'

" use for C language, list struct and function with vim
Plug 'majutsushi/tagbar'


" git plugin
"
" git based plugin
Plug 'tpope/vim-fugitive'
" git diff
Plug 'arkwright/vim-manhunt'
" git branch
Plug 'sodapopcan/vim-twiggy'

" brackets
Plug 'jiangmiao/auto-pairs'

" Formated
Plug 'rhysd/vim-clang-format'
