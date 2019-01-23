" use tagbar for C language
nmap <F1> :TagbarToggle<CR>

" open menu
nmap <F2> :call g:quickmenu#toggle(0)<CR>

" F5 extend key
"
" use BROWSER for html
autocmd FileType html :map <F5> :!firefox %<CR> "

" insert datetime to file
nmap <F6> :pu=strftime('%Y-%m-%d %H:%M:%S')<CR>

" full current window
silent! nunmap +
nnoremap + <C-w>_<C-w><Bar>

" A good menu ui for user
noremap <leader>m :call quickmenu#toggle(0)<cr>

" Tab complet
inoremap <tab> <C-n>


fu! OpenTerminal()
    " open split windows on the topleft
    topleft split
    " resize the height of terminal windows to 30
    resize 30
    :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
endf

nnoremap <F3> :call OpenTerminal()<CR>

fu! RunShellCommand()
    let command = getline(line("."))
    exec "r!" command
endf

nnoremap <F4> :call RunShellCommand()<CR>
