let s:cpo_save = &cpo
set cpo&vim

if exists("did_install_default_menus")
call Lang_stop()
unlet did_install_default_menus
endif

let g:LANG_PATH=$LANG
let g:LANG_FILE= $VIM_CONFIG . "/lang/menu_" . tolower(g:LANG_PATH) . ".vim"
exe "source " g:LANG_FILE

if !exists("did_install_default_menus")
let did_install_default_menus = 1

call Lang_start()

endif " !exists("did_install_syntax_menu")

" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save
