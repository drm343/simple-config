function! Lang_start()
" add tabpage
nmenu <silent> 200.500 Tab.Create :tabnew<CR>
nmenu <silent> 200.501 Tab.Next :tabnext<CR>
nmenu <silent> 200.502 Tab.Previous :tabprevious<CR>
nmenu <silent> 200.503 Tab.Close :tabclose<CR>
noremap <leader>t :emenu Tab.<C-Z>


" add config
nmenu 10.502 Config.Reload :source %<CR>
nmenu 10.510 Config.Grep.Origin :call Grep_Reset()<CR>
nmenu 10.511 Config.Grep.Git :call Grep_Git()<CR>


" add old file
nmenu 20.500 File.Save :w<CR>
nmenu 20.501 File.Save\ And\ Close :wq<CR>
nmenu <silent> 20.510 File.Open\ File.Replace :call EditFile()<CR>
nmenu <silent> 20.511 File.Open\ File.Split :call SplitEditFile()<CR>
nmenu 20.550 File.Quit :q<CR>


" add buffer manager
nmenu <silent> 30.500 Buffer.Replace :buffer <C-Z>
nmenu <silent> 30.501 Buffer.Split :sbuffer <C-Z>
nmenu <silent> 30.502 Buffer.Delete :bdelete <C-Z>


" quickfix 選單
nmenu <silent> 40.500 QuickFix.Open :copen<CR>
nmenu <silent> 40.501 QuickFix.Next :cnext<CR>
nmenu <silent> 40.502 QuickFix.Previous :cprev<CR>
nmenu <silent> 40.503 QuickFix.Close :cclose<CR>


" Project manager
nmenu <silent> 50.501 Project.Save :call Project_save()<CR>
nmenu <silent> 50.502 Project.Setting :call Project_config()<CR>
nmenu <silent> 50.503 Project.Close :qa<CR>


" vimwiki 選單
nmenu <silent> 60.500 Wiki.Index :VimwikiIndex<CR>
nmenu <silent> 60.501 Wiki.Daily.Index :VimwikiDiaryIndex<CR>
nmenu <silent> 60.502 Wiki.Daily.Rebuild :VimwikiDiaryGenerateLinks<CR>
nmenu <silent> 60.503 Wiki.Todo :VimwikiToggleListItem<CR>

endfunction


function! Lang_stop()
menutrans clear
" Don't use 'unmenu *' because vimwiki use menu named 'Vimwiki'.
" And vimwiki did not provide a global function to rebuild menu.
unmenu Tab
unmenu Config
unmenu File
unmenu Buffer
unmenu Project
unmenu QuickFix
unmenu Wiki
endfunction
