function! C_loading()
if !exists("enable_c_language_loading")
    let enable_c_language_loading = 1

    " use tagbar for C language
    nmap <F1> :TagbarToggle<CR>

    nmap <F5> :w<CR>:make<CR><CR><CR>

    "set dictionary+=$VIM_CONFIG/programming-language/c.txt

    call C_imenu()

    packadd gen_tags
    packadd tagbar
endif
endfunction


function! C_imenu()

" add include struct
imenu <silent> 1000.500 pl.include.user-lib #include ""<ESC>i
imenu <silent> 1000.501 pl.include.stdio #include <stdio.h><CR>
imenu <silent> 1000.502 pl.include.stdlib #include <stdlib.h><CR>
imenu <silent> 1001.500 pl.struct.define struct NAME {<CR>};<ESC>
imenu <silent> 1001.501 pl.struct.typedef typedef ORIGIN NEW;<ESC>
imenu <silent> 1001.502 pl.struct.use struct NAME;<ESC>
imenu <silent> 1002.500 pl.for for (TYPE VAR; CONDITION; VAR++) {<CR>}<ESC>
imenu <silent> 1003.500 pl.while while (CONDITION) {<CR>}<ESC>
imenu <silent> 1004.500 pl.goto.define  LABEL:<ESC>
imenu <silent> 1004.501 pl.goto.use goto LABEL;<ESC>
imenu <silent> 1005.500 pl.return return VAR;<ESC>
imenu <silent> 1006.500 pl.if.if if (CONDITION) {<CR>}<ESC>
imenu <silent> 1006.501 pl.if.then else if (CONDITION) {<CR>}<ESC>
imenu <silent> 1006.502 pl.if.else else {<CR>}<ESC>
inoremap <F1> <C-o>:emenu pl.<C-Z>

endfunction


autocmd FileType c,cpp call C_loading()
