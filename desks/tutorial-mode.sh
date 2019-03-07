# tutorial-mode.sh
#
# Description: tutorial mode
#
# this
help () {
    desk
    echo '
Use this for your tutorial.'
}


tutorial-main-0 () {
    echo '歡迎使用 simple config 這個設定檔。
想學習如何使用請輸入 m 指令啟動 fzf-menu，然後執行 tutorial。
關閉本訊息請在 $SIMPLE_CONFIG/config.sh 中將 WELCOME 設定成 false。
可以使用 m 指令啟動 fzf-menu 後執行 setting-config，再執行 reload-menu 即可'
}


tutorial-main-1 () {
    echo '只要會 m 這個指令，就已經學會這個設定檔的基本操作了。
這個設定檔跟 vim 相同，使用 "mode" 的方式來管理 m 這個指令跟操作。
接下來詳細介紹的部份就由文件來介紹了，請打開 menu 執行 tutorial-document
來獲得進一步資訊。'
}


document () {
    editor $SIMPLE_CONFIG_DOC/simple-config-zh_TW.txt
}


# tutorial menu
tutorial-menu () {
    local result=`echo "tutorial-main-0
tutorial-main-1
document
help
exit" | fzf`
    $result
}


# open menu
alias m='tutorial-menu'
