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


" vimwiki convert link to html
function! VimwikiLinkConverter(link, source_wiki_file, target_html_file)
    if a:link =~# '^file:'
        let link_infos = vimwiki#base#resolve_link(a:link)
        let html_link = vimwiki#path#relpath(
                    \ fnamemodify(a:source_wiki_file, ':h'),
                    \ link_infos.filename)
        let relative_link =
                    \ fnamemodify(a:target_html_file, ':h') . '/' . html_link
        "call system('cp ' . fnameescape(link_infos.filename) .
        "            \ ' ' . fnameescape(relative_link))
        return html_link
    endif
    return ''
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
    elseif link_infos.scheme == 'vim'
        exec link_infos.filename
        return 1
    endif
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


function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction


"nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
"nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
"nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>


function! EditFile()
    call FzyCommand("find . -type f", ":e")
endfunction


function! SplitEditFile()
    call FzyCommand("find . -type f", ":split")
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
