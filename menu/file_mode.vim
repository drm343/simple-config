let g:menus.f = {
            \ 'description': 'f - file mode'
            \ }
let g:menus.f.command_candidates = [
            \ ['s - search and open file', 'Denite file/rec'],
            \ ['nt - NERDTree', 'NERDTreeToggle'],
            \ ]

let g:menus.cf = {
            \ 'description': 'cf - current file mode'
            \ }
let g:menus.cf.command_candidates = [
            \ ['s - save', 'w!'],
            \ ['sq - save and quit', 'wq!'],
            \ ['q - quit', 'q!'],
            \ ]
