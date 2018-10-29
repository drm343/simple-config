let g:menus.quickfix = {
            \ 'description': 'qf - quickfix mode'
            \ }
let g:menus.quickfix.command_candidates = [
            \ ['open quickfix window', 'copen'],
            \ ['close quickfix window', 'cclose'],
            \ ['next error', 'cnext'],
            \ ['previous error', 'cprev'],
            \ ]
