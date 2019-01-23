function! g:Quickmenu_currentAdd(var)
    if has_key(g:quickmenu_var, a:var) == 0
        let g:quickmenu_counter = g:quickmenu_counter + 1
        let g:quickmenu_var[a:var] = g:quickmenu_counter
        call g:quickmenu#current(g:quickmenu_counter)
    endif
endfunction

function! g:Quickmenu_current(var)
    call g:quickmenu#current(g:quickmenu_var[a:var])
endfunction

function! g:Quickmenu_toggle(var)
    call g:quickmenu#toggle(g:quickmenu_var[a:var])
endfunction

let g:quickmenu_counter = -1
let g:quickmenu_var = {}

" 主選單
call g:Quickmenu_currentAdd("main")
call g:quickmenu#reset()
call quickmenu#header("主選單")

call g:quickmenu#append('重載設定', 'source %', '')
call g:quickmenu#append('檔案', ':call Quickmenu_toggle("file")', '本檔案的操作')
call g:quickmenu#append('打開舊檔', ':call Quickmenu_toggle("open old file")', '使用檔案管理器打開舊檔案')
call g:quickmenu#append('終端機', ':call OpenTerminal()', '打開終端機')
call g:quickmenu#append('Buffer 管理', ':call Quickmenu_toggle("buffer")', '')

" 檔案
call g:Quickmenu_currentAdd("file")
call g:quickmenu#reset()
call g:quickmenu#header("檔案")
call g:quickmenu#append('儲存', 'w', '')
call g:quickmenu#append('儲存後關閉', 'wq', '')
call g:quickmenu#append('關閉', 'q', '')

" 打開舊檔
call g:Quickmenu_currentAdd("open old file")
call g:quickmenu#reset()
call g:quickmenu#header("打開舊檔")
call g:quickmenu#append('取代', ':EditVifm', '直接打開檔案')
call g:quickmenu#append('在新視窗打開', ':SplitVifm', '在新視窗打開檔案')

" Buffer 管理器
call g:Quickmenu_currentAdd("buffer")
call g:quickmenu#reset()
call g:quickmenu#header("Buffer 管理器")
call g:quickmenu#append('切換 Buffer', ':BufExplorer', '')
call g:quickmenu#append('打開 Buffer', ':BufExplorerHorizontalSplit', '將 Buffer 開到新視窗')
