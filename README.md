# simple-config
Config for bash

## Required


## Install

### 1. Clone this repo to your ~/.config

* git clone git@github.com:drm343/simple-config.git

### 2. Run scripts/install.sh in simple-config

* cd .config/simple-config

* bash ./scripts/install.sh

This will backup your origin .bashrc to .bashrc.bk, then source it in .bashrc.

## Uninstall

Remove simple-config and mv .bashrc.bk to .bashrc

## How to use

Just type m and enter, you will see command menu.

Bash use menu-complete, not complete. You can comment 'TAB:menu-complete' to use origin complete behavior in init.sh.
