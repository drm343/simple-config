" use tagbar for C language
nmap <F1> :TagbarToggle<CR>

" open menu
nnoremap <F2> :call UseFZFMenu('printf "MyTest\nMain_Menu"')<CR>

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
noremap <leader>l :call g:quickmenu#toggle(g:quickmenu_last_counter)<cr>

" Tab complet
inoremap <tab> <C-n>
vnoremap <tab> zA<Esc>
vnoremap <leader>f zf
vnoremap <leader>d zd

" set wiki menu
autocmd FileType vimwiki
  \ noremap <leader>w :call Quickmenu_toggle('wiki')<cr>

" wiki resolve link handler
function! s:cmd_resolve_link(link_text)
    let link_text = a:link_text
    let link_infos = {
                \ 'index': -1,
                \ 'scheme': '',
                \ 'filename': '',
                \ 'anchor': '',
                \ }
    if link_text =~# '^shell:'
        let link_infos.scheme = 'shell'
        let link_infos.filename = link_text[6:]
        let link_infos.index = 1
        return link_infos
    elseif link_text =~# '^bash:'
        let link_infos.scheme = 'run-bash'
        let link_infos.filename = link_text[5:]
        let link_infos.index = 1
        return link_infos
    elseif link_text =~# '^vim:'
        let link_infos.scheme = 'vim'
        let link_infos.filename = link_text[4:]
        let link_infos.index = 1
        return link_infos
    else
        return vimwiki#base#resolve_link(a:link_text)
    endif
endfunction

" wiki remap link handler
function! VimwikiLinkHandler(link)
    let link = a:link

    let link_infos = s:cmd_resolve_link(link)

    if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    elseif link_infos.scheme == 'file'
        exec 'vsplit ' . fnameescape(link_infos.filename)
        return 1
    elseif link_infos.scheme == 'shell'
        exec '!./' . fnameescape(link_infos.filename)
        return 1
    elseif link_infos.scheme == 'run-bash'
        exec '!' . fnameescape(link_infos.filename)
        return 1
    elseif link_infos.scheme == 'vim'
        echo link_infos.filename
        exec link_infos.filename
        return 1
    endif
endfunction


function! OpenTerminal()
    " open split windows on the topleft
    topleft split
    " resize the height of terminal windows to 30
    resize 30
    :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
endfunction


function! ReadShellResultCommand()
    let command = getline(line("."))
    exec "r!" command
endfunction
nnoremap <F4> :call ReadShellResultCommand()<CR>


function! RunVimCommand()
let command = getline(line("."))
    exec command
endfunction
nnoremap <F5> :call RunVimCommand()<CR>


function! MyTest()
    echo "hello"
endfunction


function! Main_Menu()
    call g:Quickmenu_toggle("main")
endfunction


fu! UseFZFMenu(fzf_menu)
    let my_command=fzf#run({'source': a:fzf_menu, 'down': '50%'})
    let my_command=get(my_command, 0, "")
    if my_command =~ "^$"
        echo "nothing"
    else
        exec ":call" my_command . "()"
    endif
endf
