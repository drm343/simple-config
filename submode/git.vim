" git init
function Ginit()
    execute ":!git init"
    execute ":!touch .gitignore"
    execute ":!git add .gitignore"
    execute ":!git commit -m 'Init Git'"
endfunction

" git add
function Gadd()
    execute ":Git add -- ."
    execute ":q"
    execute ":echo \"git add\"expand('%:t')\"ok\""
endfunction

command Ginit call Ginit()
command Gadd call Gadd()

" <leader>g -> git-mode
call submode#enter_with('git-mode', 'n', '', '<leader>g')

" i -> init
call submode#map('git-mode', 'n', '', 'i', ':Ginit<CR>')

" a -> add
call submode#map('git-mode', 'n', '', 'a', ':Gadd<CR>')

" c -> commit
call submode#map('git-mode', 'n', '', 'c', ':Gcommit<CR>')

" b -> branch
call submode#map('git-mode', 'n', '', 'b', ':Twiggy<CR>')

" d -> diff
call submode#map('git-mode', 'n', '', 'd', ':Manhunt<CR>')
