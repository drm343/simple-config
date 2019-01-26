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
noremap <leader>t :call Quickmenu_toggle("tab")<cr>
noremap <leader>l :call g:quickmenu#toggle(g:quickmenu_last_counter)<cr>

" Tab complet
inoremap <tab> <C-n>


fu! OpenTerminal()
    " open split windows on the topleft
    topleft split
    " resize the height of terminal windows to 30
    resize 30
    :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
endf

fu! ReadShellResultCommand()
    let command = getline(line("."))
    exec "r!" command
endf

nnoremap <F4> :call ReadShellResultCommand()<CR>

fu! RunVimCommand()
    let command = getline(line("."))
    exec command
endf
nnoremap <F5> :call RunVimCommand()<CR>


fu! g:IncludeSession(plugin)
    let SESSION_DIR = "$VIM_CONFIG/session/"
    exec "source" SESSION_DIR . a:plugin
endf


fu! AddIncludeSession()
    let bash_command='find "$VIM_CONFIG/session/" -name "*x\.vim" -printf "%f\n"'
    let plugin_name=fzf#run({'source': bash_command, 'down': '50%'})
    exec 'r!echo "IncludeSession(\"' . get(plugin_name, 0, "") . '\")" '
endf
nnoremap <F3> :call AddIncludeSession()<CR>
