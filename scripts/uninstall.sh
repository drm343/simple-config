#!/usr/bin/env bash
rm $HOME/.vim/autoload/plug.vim
rm -r $HOME/.vim/my-plug
cp $HOME/.vimrc.bk $HOME/.vimrc
cp $HOME/.bashrc.bk $HOME/.bashrc
echo "You can remove $SIMPLE_CONFIG for uninstall security now"
