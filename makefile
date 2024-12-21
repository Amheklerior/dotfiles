include install/configs/env.mk
include install/rules/prepare.mk
include install/rules/brew.mk
include install/rules/packages.mk
include install/rules/core.mk
include install/rules/shell.mk
include install/rules/stow.mk
include install/rules/dev.mk
include install/rules/settings.mk

.PHONY: init bootstrap setup

# force make to use bash to interpret the recipes
# NOTE: default shell used my make is /bin/sh
SHELL := /bin/bash


init: prepare brew

bootstrap: packages core shell dotfiles

setup: dev settings
