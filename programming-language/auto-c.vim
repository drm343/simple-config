function s:use_c()
    " use make for C language
    "autocmd FileType c :nmap <F5> :w<CR>:gmake<CR><CR><CR>
    nmap <F5> :w<CR>:gmake<CR><CR><CR>

    " use make for C language
    "autocmd FileType c,cpp :nmap <F6> :ClangFormat<CR>
    nmap <F6> :ClangFormat<CR>

    " Auto run format
    let g:clang_format#command="clang-format40"

    set dictionary+=$HOME/.config/nvim/programming-language/c.txt
endfunction

let filetype_m='objc'
autocmd FileType c,cpp,objc call s:use_c()
