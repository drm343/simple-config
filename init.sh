#!/usr/bin/env bash
# Load user config
export SIMPLE_CONFIG=$HOME/.config/simple-config
. $SIMPLE_CONFIG/config.sh

# Load user alias
. $SIMPLE_CONFIG/alias.sh

# Load plugin for bash complete
. $SIMPLE_CONFIG/submodules/desk/shell_plugins/bash/desk

# Load enhance command
. $SIMPLE_CONFIG/function/private/load-function-0.1.0/load-function 

for i in $SIMPLE_CONFIG/function/{private,public}/*;
do
    load-function $i
done

# thanks for http://simple-configrcgenerator.com/
. $SIMPLE_CONFIG/themes/$THEME


# enable bash completion in interactive shells
if is not $(shopt -oq posix); then
  if is existing /usr/share/bash-completion/bash_completion; then
    . /usr/share/bash-completion/bash_completion
  elif is existing /etc/bash_completion; then
    . /etc/bash_completion
  fi
fi
load-completion

# welcome message
if is true $WELCOME; then
    echo "歡迎使用本設定檔，教學文件請參考 doc/index-zh_TW.wiki，或是執行 doc 指令也可以。

關閉本訊息請在 config.sh 中將 WELCOME 變數設為 false，也可以執行 setting-config"
fi
