include install/configs/env.mk
include install/rules/prepare.mk
include install/rules/brew.mk
include install/rules/packages.mk
include install/rules/core.mk
include install/rules/stow.mk
include install/rules/dev.mk
include install/rules/settings.mk

.PHONY: bootstrap wrapup 

# the default command to run by just typing `make`
.DEFAULT_GOAL := bootstrap

# force make to use bash to interpret the recipes
# NOTE: default shell used my make is /bin/sh
SHELL := /bin/bash


bootstrap: prepare brew packages core dotfiles dev settings wrapup

wrapup:
	echo "[Done]: You're ready to rock \m/"	
	rm ${XDG_DATA_HOME}/personal-repo
	rm ${XDG_DATA_HOME}/work-repo
	brew doctor
	brew cleanup