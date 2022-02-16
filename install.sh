#!/usr/bin/env bash
git submodule update


SIMPLE_CONFIG=$HOME/.config/simple-config
DOTFILES_CONFIG=$SIMPLE_CONFIG/submodules/dotfiles
. $SIMPLE_CONFIG/lib/*

YES_NO="1) no\n2) yes"


cd $HOME

PS3="do you want to backup your .bashrc? [number]: "
select opt in no yes; do
    [[ -n $opt ]] || { echo -e "$YES_NO"; continue; }
    break
done

case $opt in
    no) 
        ans=false
        ;;
    yes)
        ans=true
        ;;
    *)
        ans=false
        ;;
esac


if $ans; then
    if is existing $HOME/.bashrc; then
        cp $HOME/.bashrc $HOME/.bashrc.bk
    fi
fi
cp $DOTFILES_CONFIG/bashrc $HOME/.bashrc


PS3="do you want to backup your .vimrc? [number]: "
select opt in no yes; do
    [[ -n $opt ]] || { echo -e "$YES_NO"; continue; }
    break
done

case $opt in
    no) 
        ans=false
        ;;
    yes)
        ans=true
        ;;
    *)
        ans=false
        ;;
esac


echo "setup .vimrc"
if $ans; then
    if is existing $HOME/.vimrc; then
        cp $HOME/.vimrc $HOME/.vimrc.bk
    fi
fi
cp $DOTFILES_CONFIG/vimrc $HOME/.vimrc


echo "create trash dir for vim"
mkdir -p ~/.local/share/trash/vim/{backup,swp,undo}

echo "create trash dir for others"
mkdir -p ~/.local/share/trash/other 


pushd $SIMPLE_CONFIG/submodules/fzy
make
make DESTDIR=~/.local PREFIX=/ install
popd
