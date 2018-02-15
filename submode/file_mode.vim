" remove FileBeagle key
let g:filebeagle_suppress_keymaps=1

" <leader>f -> file mode
call submode#enter_with('file-mode', 'n', '', '<leader>f')

" s -> search file and open
call submode#map('file-mode', 'n', '', 's', ':CtrlP<CR>')

" o -> open file with explorer
call submode#map('file-mode', 'n', '', 'o', ':FileBeagle<CR>')
