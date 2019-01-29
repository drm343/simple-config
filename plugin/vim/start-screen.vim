function! Start()
  "Create a new unnamed buffer to display our splash screen inside of.
  enew

  " Set some options for this buffer to make sure that does not act like a
  " normal winodw.
  setlocal
    \ bufhidden=wipe
    \ buftype=nofile
    \ nobuflisted
    \ nocursorcolumn
    \ nocursorline
    \ nolist
    \ nonumber
    \ noswapfile
    \ norelativenumber

  " Our message goes here. Mine is simple.
  exec 'read' $VIM_CONFIG . '/screen.txt'
  goto | delete

  " When we are done writing out message set the buffer to readonly.
  setlocal
    \ nomodifiable
    \ nomodified

  " Just like with the default start page, when we switch to insert mode
  " a new buffer should be opened which we can then later save.
  nnoremap <buffer><silent> e :enew<CR>
  nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> t :edit $SIMPLE_CONFIG_DOC/vim-tutorial-zh_TW.txt<CR>
  nnoremap <buffer><silent> <leader>m :enew <bar> call g:quickmenu#toggle(0)<CR>

endfunction

if argc() == 0
  autocmd VimEnter * call Start()
endif
