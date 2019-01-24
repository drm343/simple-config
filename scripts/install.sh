#!/usr/bin/env bash
git submodule init
git submodule update

SIMPLE_CONFIG=$HOME/.config/simple-config

cp $HOME/.bashrc $HOME/.bashrc.bk
cp $SIMPLE_CONFIG/.bashrc $HOME/.bashrc
prefix=$SIMPLE_CONFIG/submodules/fzf prefix_expand=$SIMPLE_CONFIG/submodules/fzf $SIMPLE_CONFIG/submodules/fzf/install

cp $HOME/.vimrc $HOME/.vimrc.bk
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $SIMPLE_CONFIG/plugin/vim/.vimrc -o $HOME/.vimrc
vi +PlugInstall +:q +:q
