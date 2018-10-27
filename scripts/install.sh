#!/usr/bin/env bash
git submodules init
git submodules update

SIMPLE_CONFIG=$HOME/.config/simple-config

cp $HOME/.bashrc $HOME/.bashrc.bk
cp $SIMPLE_CONFIG/.bashrc $HOME/.bashrc
$SIMPLE_CONFIG/submodules/fzf/install --prefix=$SIMPLE_CONFIG/submodules/fzf --prefix_expand=$SIMPLE_CONFIG/submodules/fzf
