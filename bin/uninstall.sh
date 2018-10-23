#!/usr/bin/env sh
rm $HOME/.vim/autoload/plug.vim
rm -r $HOME/.vim/my-plug
rm $HOME/.vimrc
cp $HOME/.vimrc.bk $HOME/.vimrc
