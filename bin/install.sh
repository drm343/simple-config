#!/usr/bin/env sh
cp $HOME/.vimrc $HOME/.vimrc.bk
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "source \$HOME/.config/nvim/init.vim" > $HOME/.vimrc
vi +PlugInstall +:q +:q
