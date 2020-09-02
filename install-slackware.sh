#!/usr/bin/env bash

SIMPLE_CONFIG=$HOME/.config/simple-config
DOTFILES_CONFIG=$SIMPLE_CONFIG/submodules/dotfiles
. $SIMPLE_CONFIG/lib/*


YES_NO="1) no\n2) yes"


PS3="do you want to backup your .profile? [number]: "
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
 

echo "setup .profile"
if $ans; then
    if is existing $HOME/.profile; then
        cp $HOME/.profile $HOME/.profile.bk
    fi
fi
cp $DOTFILES_CONFIG/profile $HOME/.profile


PS3="do you want to backup your .inputrc? [number]: "
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


echo "setup .inputrc"
if $ans; then
    if is existing $HOME/.inputrc; then
        cp $HOME/.inputrc $HOME/.inputrc.bk
    fi
fi
cp $DOTFILES_CONFIG/inputrc $HOME/.inputrc
