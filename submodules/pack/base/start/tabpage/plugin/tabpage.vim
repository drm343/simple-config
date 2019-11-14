function! TabSwitchPreviousAndClose()
    close | tabprevious
endfunction


function! TabSwitchNextAndClose()
    close | tabnext
endfunction


function! TabOpenNewAndClose()
    close | tabnew
endfunction


function! OpenTabMenu()
  "Create a new unnamed buffer to display our splash screen inside of.
  new

  " Set some options for this buffer to make sure that does not act like a
  " normal winodw.
  setlocal
    \ bufhidden=wipe
    \ buftype=nowrite
    \ nobuflisted
    \ nocursorcolumn
    \ nocursorline
    \ nolist
    \ nonumber
    \ noswapfile
    \ norelativenumber

  " Our message goes here. Mine is simple.
  exec 'read' $SIMPLE_CONFIG_DOC . '/tabpage.wiki'
  set filetype=vimwiki
  goto | delete

  " When we are done writing out message set the buffer to readonly.
  setlocal
    \ nomodifiable
    \ nomodified

  " Just like with the default start page, when we switch to insert mode
  " a new buffer should be opened which we can then later save.
  nnoremap <buffer><silent> n :call TabOpenNewAndClose()<CR>
  nnoremap <buffer><silent> n :call TabSwitchNextAndClose()<CR>
  nnoremap <buffer><silent> p :call TabSwitchPreviousAndClose()<CR>
  nnoremap <buffer><silent> q :close<CR>
endfunction

noremap <leader>t :call OpenTabMenu()<cr>
