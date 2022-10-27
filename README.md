# simple-config
Config for bash

This project migrate to gitlab. https://gitlab.com/realnami/simple-config

## Required

* bash 5.0
* readline 8.0
* vim 8.0
* git 2.21.0
* fzy 1.0

## Optional

## Install

### 1. Clone this repo to your ~/.config

* git clone git@github.com:drm343/simple-config.git


### 2. Run make install in simple-config

* cd .config/simple-config

* make install

This step will ask you to backup your .bashrc to .bashrc.bk.
And backup your origin .vimrc to .vimrc.bk.


### 3. Source your ~/.bashrc


## Uninstall

Remove simple-config and mv your backup file to origin position.

## How to use

Just type m and enter, you will see command menu.

Bash use menu-complete, not complete. You can comment 'TAB:menu-complete' to use origin complete behavior in config.sh.
