function! g:Quickmenu_currentAdd(var)
    let g:quickmenu_counter = g:quickmenu_counter + 1
    let g:quickmenu_var[a:var] = g:quickmenu_counter
    call g:quickmenu#current(g:quickmenu_counter)
endfunction

function! g:Quickmenu_current(var)
    call g:quickmenu#current(g:quickmenu_var[a:var])
endfunction

function! g:Quickmenu_toggle(var)
    let g:quickmenu_last_counter = g:quickmenu_var[a:var]
    call g:quickmenu#toggle(g:quickmenu_last_counter)
endfunction

let g:quickmenu_last_counter = -1
let g:quickmenu_counter = -1
let g:quickmenu_var = {}

" 主選單
call g:Quickmenu_currentAdd("main")
call g:quickmenu#reset()
call g:quickmenu#header("主選單")

"call g:quickmenu#append('切換選單', ':call Quickmenu_toggle("change menu")', '切換主選單')
call g:quickmenu#append('打開舊檔', ':call Quickmenu_toggle("open old file")', '使用檔案管理器打開舊檔案')
call g:quickmenu#append('緩衝區管理', ':call Quickmenu_toggle("buffer")', '')
call g:quickmenu#append('檔案', ':call Quickmenu_toggle("file")', '本檔案的操作')
call g:quickmenu#append('終端機', ':call OpenTerminal()', '打開終端機')
call g:quickmenu#append('專案', ':call Quickmenu_toggle("project")', '用 session 的方式進行專案管理')

" 檔案
call g:Quickmenu_currentAdd("file")
call g:quickmenu#reset()
call g:quickmenu#header("檔案")

call g:quickmenu#append('重載設定', 'source %', '給 vim 使用')
call g:quickmenu#append('儲存', 'w', '')
call g:quickmenu#append('儲存後關閉', 'wq', '')
call g:quickmenu#append('關閉', 'q', '')

" 打開舊檔
call g:Quickmenu_currentAdd("open old file")
call g:quickmenu#reset()
call g:quickmenu#header("打開舊檔")

call g:quickmenu#append('取代', ':EditVifm', '直接打開檔案')
call g:quickmenu#append('在新視窗打開', ':SplitVifm', '在新視窗打開檔案')

" 緩衝區管理器
call g:Quickmenu_currentAdd("buffer")
call g:quickmenu#reset()
call g:quickmenu#header("緩衝區管理器")

call g:quickmenu#append('切換緩衝區', ':BufExplorer', '')
call g:quickmenu#append('打開緩衝區', ':BufExplorerHorizontalSplit', '將緩衝區開到新視窗')

" Tab 操作相關
call g:Quickmenu_currentAdd("tab")
call g:quickmenu#reset()
call g:quickmenu#header("tabpage 選單")

call g:quickmenu#append('新分頁', ':tabnew', '')
call g:quickmenu#append('下一個分頁', ':tabnext', '')
call g:quickmenu#append('上一個分頁', ':tabprevious', '')
call g:quickmenu#append('關閉', ':tabclose', '')

" 專案管理工具
call g:Quickmenu_currentAdd("project")
call g:quickmenu#reset()
call g:quickmenu#header("專案")

function! g:Project_save ()
    mksession! Project.vim
    silent!touch Projectx.vim
    echo "儲存專案成功"
endfunction

call g:quickmenu#append('儲存開發狀態', ':call Project_save()', '儲存成 Project.vim 方便後續恢復開發')

function! g:Project_config ()
    tabnew | edit Projectx.vim
endfunction

call g:quickmenu#append('設定', ':call Project_config()', '修改 Projectx.vim 調整專案設定')
call g:quickmenu#append('儲存全部檔案', ':wa', '儲存全部修改過的檔案')
call g:quickmenu#append('關閉全部檔案', ':qa', '關閉全部檔案，如果有修改過未儲存檔案，會無法關閉')
