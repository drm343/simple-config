function! Lang_start()
" add tabpage
nmenu <silent> 200.500 分頁.新分頁 :tabnew<CR>
nmenu <silent> 200.501 分頁.下一頁 :tabnext<CR>
nmenu <silent> 200.502 分頁.上一頁 :tabprevious<CR>
nmenu <silent> 200.503 分頁.關閉分頁 :tabclose<CR>
noremap <leader>t :emenu 分頁.<C-Z>


" add config
nmenu 10.502 設定檔.重載 :source %<CR>
nmenu 10.510 設定檔.Grep.原始設定 :call Grep_Reset()<CR>
nmenu 10.511 設定檔.Grep.Git      :call Grep_Git()<CR>


" add old file
nmenu 20.500 檔案.儲存 :w<CR>
nmenu <silent> 20.510 檔案.開啟舊檔.取代視窗 :call EditFile()<CR>
nmenu <silent> 20.511 檔案.開啟舊檔.開新視窗 :call SplitEditFile()<CR>
nmenu 20.550 檔案.儲存並關閉 :wq<CR>
nmenu 20.551 檔案.關閉 :q<CR>


" add buffer manager
nmenu <silent> 30.500 緩衝區.取代視窗 :buffer <C-Z>
nmenu <silent> 30.501 緩衝區.開新視窗 :sbuffer <C-Z>
nmenu <silent> 30.502 緩衝區.刪除 :bdelete <C-Z>


" quickfix 選單
nmenu <silent> 40.500 QuickFix.打開 :copen<CR>
nmenu <silent> 40.501 QuickFix.下一個訊息 :cnext<CR>
nmenu <silent> 40.502 QuickFix.上一個訊息 :cprev<CR>
nmenu <silent> 40.503 QuickFix.關閉 :cclose<CR>


" Project manager
nmenu <silent> 50.501 專案.儲存專案 :call Project_save()<CR>
nmenu <silent> 50.502 專案.設定 :call Project_config()<CR>
nmenu <silent> 50.503 專案.關閉專案 :qa<CR>


" vimwiki 選單
nmenu <silent> 60.500 Wiki.首頁 :VimwikiIndex<CR>
nmenu <silent> 60.501 Wiki.日記.首頁 :VimwikiDiaryIndex<CR>
nmenu <silent> 60.502 Wiki.日記.重建日期 :VimwikiDiaryGenerateLinks<CR>
nmenu <silent> 60.503 Wiki.清單 :VimwikiToggleListItem<CR>
endfunction


function! Lang_stop()
menutrans clear
" Don't use 'unmenu *' because vimwiki use menu named 'Vimwiki'.
" And vimwiki did not provide a global function to rebuild menu.
unmenu 分頁
unmenu 設定檔
unmenu 檔案
unmenu 緩衝區
unmenu QuickFix
unmenu 專案
unmenu Wiki
endfunction
