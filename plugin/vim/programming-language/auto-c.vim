function s:load_c_menu()
    let g:menus.c_mode = {
                \ 'description': 'c language mode'
                \ }
    let g:menus.c_mode.command_candidates = [
                \ ['for', 'r!sed -n 1,2p $HOME/.config/nvim/programming-language/c-for.txt'],
                \ ]
endfunction

function s:use_c()
    " use make for C language
    if executable('gmake')
        nmap <F5> :w<CR>:gmake<CR><CR><CR>
    elseif executable('make')
        nmap <F5> :w<CR>:make<CR><CR><CR>
    endif

    call s:load_c_menu()
    set dictionary+=$HOME/.config/nvim/programming-language/c.txt
endfunction

let filetype_m='objc'
autocmd FileType c,cpp,objc call s:use_c()
