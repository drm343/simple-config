" <leader>p -> plugin-mode
call submode#enter_with('plugin-mode', 'n', '', '<leader>p')

" c -> clean plugin
call submode#map('plugin-mode', 'n', '', 'c', ':PlugClean<CR>')

" i -> install plugin
call submode#map('plugin-mode', 'n', '', 'i', ':PlugInstall<CR>')

" q -> leave plugin-mode
call submode#map('plugin-mode', 'n', '', 'd', ':q<CR>')
