function! C_loading()
if !exists("enable_c_language_loading")
    let enable_c_language_loading = 1

    " use tagbar for C language
    nmap <F1> :TagbarToggle<CR>

    nmap <F5> :w<CR>:make<CR><CR><CR>

    set dictionary+=$VIM_CONFIG/programming-language/c.txt

    packadd gen_tags
    packadd tagbar
endif
endfunction


autocmd FileType c call C_loading()
