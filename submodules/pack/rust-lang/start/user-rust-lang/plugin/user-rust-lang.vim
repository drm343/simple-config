function! Rust_loading()
if !exists("enable_rust_language_loading")
    let enable_rust_language_loading = 1

    let g:tagbar_type_rust = {
                \ 'ctagstype' : 'rust',
                \ 'kinds' : [
                    \'T:types,type definitions',
                    \'f:functions,function definitions',
                    \'g:enum,enumeration names',
                    \'s:structure names',
                    \'m:modules,module names',
                    \'c:consts,static constants',
                    \'t:traits',
                    \'i:impls,trait implementations',
                    \]
                    \}

    " use tagbar for C language
    nmap <F1> :TagbarToggle<CR>

    "set dictionary+=$VIM_CONFIG/programming-language/c.txt

    packadd gen_tags
    packadd tagbar
endif
endfunction


autocmd FileType rust call Rust_loading()
