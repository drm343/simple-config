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
noremap <leader>m :emenu <C-Z>

" Fold: use in set foldmethod=manual
vnoremap <tab> zA<Esc>
vnoremap <leader>f zf
vnoremap <leader>d zd


" set wiki menu
autocmd FileType vimwiki
  \ noremap <leader>w :emenu Wiki.<C-Z>


" 
autocmd FileType coq
  \ noremap <leader>w :CoqRunToCursor<CR>


" wiki resolve link handler
function! s:cmd_resolve_link(link_text)
    let link_text = a:link_text
    let link_infos = {
                \ 'index': -1,
                \ 'scheme': '',
                \ 'filename': '',
                \ 'anchor': '',
                \ }
    if link_text =~# '^script:'
        let link_infos.scheme = 'shell-script'
        let link_infos.filename = link_text[6:]
        let link_infos.index = 1
        return link_infos
    elseif link_text =~# '^bash:'
        let link_infos.scheme = 'run-bash'
        let link_infos.filename = link_text[5:]
        let link_infos.index = 1
        return link_infos
    elseif link_text =~# '^dir:'
        let link_infos.scheme = 'dir'
        let link_infos.filename = link_text[4:]
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
    elseif link_infos.scheme == 'shell-script'
        exec '!./' . fnameescape(link_infos.filename)
        return 1
    elseif link_infos.scheme == 'run-bash'
        exec '!' . fnameescape(link_infos.filename)
        return 1
    elseif link_infos.scheme == 'dir'
        exec 'cd ' . fnameescape(link_infos.filename)
        close
        call EnhanceReadls()
        return 1
    elseif link_infos.scheme == 'vim'
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


function! UseFZFMenu(fzf_menu)
    let my_command=fzf#run({'source': a:fzf_menu, 'down': '50%'})
    let my_command=get(my_command, 0, "")
    if my_command =~ "^$"
        echo "nothing"
    else
        exec ":call" my_command . "()"
    endif
endfunction


function! EditFile()
    let my_file_list=fzf#run({'down': '50%'})
    let my_file=get(my_file_list, 0, "")
    if my_file =~ "^$"
        echo my_file_list
        echo my_file
        "echo "nothing"
    else
        exec ":open" my_file
    endif
endfunction


function! SplitEditFile()
    let my_file_list=fzf#run({'down': '50%'})
    let my_file=get(my_file_list, 0, "")
    if my_file =~ "^$"
        echo "nothing"
    else
        exec ":split" my_file
    endif
endfunction


function! EnhanceReadls()
    new

    " Set some options for this buffer to make sure that does not act like a
    " normal winodw.
    setlocal
                \ bufhidden=delete
                \ buftype=nowrite
                \ nobuflisted
                \ nocursorcolumn
                \ nocursorline
                \ nolist
                \ nonumber
                \ noswapfile

    put = '[[dir:..]]'
    exec 'r!map vim-extend *'
    set filetype=vimwiki
    goto | delete


    " command for list result
    nnoremap <buffer><silent> q :close<CR>
endfunction


" add Project manager
function! g:Project_save ()
    mksession! Project.vim
    silent!touch Projectx.vim
    echo "Project save success"
endfunction


function! g:Project_config ()
    tabnew | edit Projectx.vim
endfunction


function! g:Grep_Git ()
    set grepprg=git\ --no-pager\ grep\ --no-color\ -n\ $*
    set grepformat=%f:%l:%m,%m\ %f\ match%ts,%f
endfunction


function! g:Grep_Reset ()
    set grepprg=grep\ -n\ $*\ /dev/null
    set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
endfunction


function! OpenTutorialDoc()
    edit $SIMPLE_CONFIG/doc/vim-tutorial-zh_TW.wiki
    set filetype=vimwiki
endfunction
