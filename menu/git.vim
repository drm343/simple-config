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


let g:menus.g = {
            \ 'description': 'g - git mode'
            \ }
let g:menus.g.command_candidates = [
            \ ['init', 'Ginit'],
            \ ['add', 'Gadd'],
            \ ['commit', 'Gcommit'],
            \ ['branch', 'Twiggy'],
            \ ['diff', 'Manhunt'],
            \ ]
