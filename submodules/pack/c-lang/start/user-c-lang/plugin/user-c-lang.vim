function! C_loading()
" use tagbar for C language
nmap <F1> :TagbarToggle<CR>

nmap <F5> :w<CR>:make<CR><CR><CR>

set dictionary+=$VIM_CONFIG/programming-language/c.txt

call g:Quickmenu_current("main")
call g:quickmenu#append('quickfix', ':call Quickmenu_toggle("c language")', '使用 quickfix')

" quickfix
call g:Quickmenu_currentAdd("c language")
call g:quickmenu#reset()
call g:quickmenu#header("quickfix")
call g:quickmenu#append('open', ':copen', '打開 quickfix')
call g:quickmenu#append('close', ':cclose', '關閉 quickfix')
call g:quickmenu#append('next', ':cnext', '下一個錯誤')
call g:quickmenu#append('previous', ':cprev', '上一個錯誤')

packadd gen_tags
packadd tagbar
endfunction


autocmd FileType c call C_loading()
