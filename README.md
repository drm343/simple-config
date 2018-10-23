# Not-IDE-config 0.1.0

This configuration files follow 3 rule.
* Vim is not IDE.
* Vim is not emacs.
* Keep it small and simple.

## Vim is not IDE

Do not make your vim as IDE. If you need a IDE, use it.<br>
Vim is a great editor, but not a great IDE.

For example, write your Ada program with gnat programming studio is best choice.<br>
You could not find other tools so helpful when coding with Ada.

Use your OS as IDE and vim as EDITOR.

## Vim is not emacs

Emacs can do anything.<br>
Emacs is a lisp machine.<br>
Emacs is an operating system and EDITOR is a tool in this OS.

But vim is not emacs.<br>
If you try to use vim as emacs, then you should give Spacemacs a chance.

Choose a tool fit your job and vim as EDITOR.

## Keep it small and simple

If a plugin need to config otherwise can not work, try to find other plugin.<br>
If you need type ? for help, try to find other plugin.

Keep your vim as small as possible, then you can easy to custom.<br>
Keep your vim as simple as possible, then you can easy to modify.

Install a plugin that simple and easy to use. And vim will be a great EDITOR you even use.

## Install and Uninstall

### Install
1. Clone this repo to $HOME/.config/nvim.
    cd $HOME/.config
    git clone git@github.com:drm343/Not-IDE-config.git nvim

2. Run bin/install.sh to setup environment.
    cd $HOME/.config/nvim
    sh ./bin/install.sh

3. You can write your code now.

### Uninstall

1. Run bin/uninstall.sh to setup environment.
    cd $HOME/.config/nvim
    sh ./bin/uninstall.sh

2. Remove $HOME/.config/nvim.
    rm -r $HOME/.config/nvim
