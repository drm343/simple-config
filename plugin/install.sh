#!/usr/bin/env bash
git submodule init
git submodule update


SIMPLE_CONFIG=$HOME/.config/simple-config
DOTFILES_CONFIG=$SIMPLE_CONFIG/submodules/dotfiles
. $SIMPLE_CONFIG/function/private/is-1.1.0/*

cd $HOME

echo "setup .profile"
if is existing $HOME/.profile; then
    cp $HOME/.profile $HOME/.profile.bk
fi
ln -s $DOTFILES_CONFIG/.profile .


echo "setup .bashrc"
if is existing $HOME/.bashrc; then
    cp $HOME/.bashrc $HOME/.bashrc.bk
fi
ln -s $DOTFILES_CONFIG/.bashrc .


echo "setup .inputrc"
if is existing $HOME/.inputrc; then
    cp $HOME/.inputrc $HOME/.inputrc.bk
fi
ln -s $DOTFILES_CONFIG/.inputrc .


FZF_PATH=$SIMPLE_CONFIG/submodules/pack/fzf/start/fzf
prefix=$FZF_PATH prefix_expand=$FZF_PATH $FZF_PATH/install

echo "setup .vimrc"
if is existing $HOME/.vimrc; then
    cp $HOME/.vimrc $HOME/.vimrc.bk
fi
ln -s $DOTFILES_CONFIG/.vimrc .

echo "create dirs for vim"
mkdir -p ~/.local/share/trash/vim/{backup,swp,undo}
