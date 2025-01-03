include install/configs/env.mk
include install/rules/prepare.mk
include install/rules/brew.mk
include install/rules/packages.mk
include install/rules/core.mk
include install/rules/shell.mk
include install/rules/stow.mk
include install/rules/dev.mk
include install/rules/settings.mk

.PHONY: prepare packages bootstrap setup-dev-env settings

# force make to use bash to interpret the recipes
# NOTE: default shell used by make is /bin/sh
SHELL := /bin/bash


prepare: sys-check backup brew-install brew-setup

packages: core-packages brew-bundle brew-check

bootstrap: core shell dotfiles

setup-dev-env: setup-node clone-personal-repo clone-work-repo

settings: sys-settings # TODO: apps-settings
