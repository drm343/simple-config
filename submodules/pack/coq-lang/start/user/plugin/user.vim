function! Coq_loading()
if !exists("enable_coq_language_loading")
    let enable_coq_language_loading = 1

    nmap <leader>p oProof. reflexivity. Qed.<C-c>
    nmap <leader>dw :bdelete __coq_ide__<CR>
endif
endfunction


autocmd FileType coq call Coq_loading()
