function! Start()
    "Create a new unnamed buffer to display our splash screen inside of.
    enew

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
    exec 'read' $SIMPLE_CONFIG . '/doc/startpage.wiki'
    set filetype=vimwiki
    goto | delete

    " When we are done writing out message set the buffer to readonly.
    setlocal
                \ nomodifiable
                \ nomodified

    " Just like with the default start page, when we switch to insert mode
    " a new buffer should be opened which we can then later save.
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> t :call OpenTutorialDoc()<CR>
    nnoremap <buffer><silent> <leader>m :emenu <C-Z>
    nnoremap <buffer><silent> q :q<CR>
endfunction


if argc() == 0
    autocmd VimEnter * call Start()
endif
