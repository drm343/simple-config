# simple-config
Config for bash

## Required

* bash 5.0
* readline 8.0
* vim 8.0
* git 2.21.0

## Install

### 1. Clone this repo to your ~/.config

* git clone git@github.com:drm343/simple-config.git

### 2. Run plugin/install.sh in simple-config

* cd .config/simple-config

* bash ./plugin/install.sh

This will backup your origin .bashrc to .bashrc.bk, then source it in .bashrc.

## Uninstall

Remove simple-config and mv .bashrc.bk to .bashrc

## How to use

Just type m and enter, you will see command menu.

Bash use menu-complete, not complete. You can comment 'TAB:menu-complete' to use origin complete behavior in config.sh.
