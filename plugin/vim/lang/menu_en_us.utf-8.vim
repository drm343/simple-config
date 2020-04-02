function! Lang_start()
" add tabpage
nmenu <silent> 200.500 Tab.Create :tabnew<CR>
nmenu <silent> 200.501 Tab.Next :tabnext<CR>
nmenu <silent> 200.502 Tab.Previous :tabprevious<CR>
nmenu <silent> 200.503 Tab.Close :tabclose<CR>
noremap <leader>t :emenu Tab.<C-Z>


" add config
nmenu 10.500 Config.Save :w<CR>
nmenu 10.501 Config.Save\ And\ Close :wq<CR>
nmenu 10.502 Config.Reload :source %<CR>
nmenu 10.510 Config.Grep.Origin :call Grep_Reset()<CR>
nmenu 10.511 Config.Grep.Git :call Grep_Git()<CR>
nmenu 10.550 Config.Quit :q<CR>


" add old file
nmenu <silent> 20.500 Old\ File.Replace :call EditFile()<CR>
nmenu <silent> 20.501 Old\ File.Split :call SplitEditFile()<CR>


" add buffer manager
nmenu <silent> 30.500 Buffer.Replace :BufExplorer<CR>
nmenu <silent> 30.501 Buffer.Split :BufExplorerHorizontalSplit<CR>


" quickfix 選單
nmenu <silent> 40.500 QuickFix.Open :copen<CR>
nmenu <silent> 40.501 QuickFix.Next :cnext<CR>
nmenu <silent> 40.502 QuickFix.Previous :cprev<CR>
nmenu <silent> 40.503 QuickFix.Close :cclose<CR>


" Project manager
nmenu <silent> 50.501 Project.Create :call Project_save()<CR>
nmenu <silent> 50.502 Project.Setting :call Project_config()<CR>
nmenu <silent> 50.503 Project.Save :wa<CR>
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
unmenu Old\ File
unmenu Buffer
unmenu Project
unmenu Wiki
endfunction
