function s:use_c()
    " use make for C language
    "autocmd FileType c :nmap <F5> :w<CR>:gmake<CR><CR><CR>
    nmap <F5> :w<CR>:gmake<CR><CR><CR>

    set dictionary+=$HOME/.config/nvim/programming-language/c.txt
endfunction

let filetype_m='objc'
autocmd FileType c,cpp,objc call s:use_c()

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
elseif executable('clangd-5.0')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd-5.0']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
elseif executable('clangd-6.0')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd-6.0']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
