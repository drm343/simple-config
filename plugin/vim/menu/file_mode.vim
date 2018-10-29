let g:menus.cf = {
            \ 'description': 'current file mode'
            \ }
let g:menus.cf.command_candidates = [
            \ ['save', 'w!'],
            \ ['save and quit', 'wq!'],
            \ ['quit', 'q!'],
            \ ]
