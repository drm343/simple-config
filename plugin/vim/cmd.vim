" use tagbar for C language
nmap <F1> :TagbarToggle<CR>

" open file from file manager
nmap <F2> :NERDTreeToggle<CR>

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
nmap <leader>m :Denite menu<CR>

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
