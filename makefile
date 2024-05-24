include install/env.mk
include install/prepare.mk
include install/brew.mk
include install/packages.mk
include install/core.mk
include install/link.mk
include install/dev.mk
include install/settings.mk

.PHONY: bootstrap wrapup 

# the default command to run by just typing `make`
.DEFAULT_GOAL := bootstrap

# force make to use bash to interpret the recipes
# NOTE: default shell used my make is /bin/sh
SHELL := /bin/bash


bootstrap: brew packages core link dev settings wrapup

wrapup:
	echo "[wrapping]: wrapping up..."
	brew cleanup
	echo "[wrapping]: creating folders..."
	mkdir -p $(TMP_DIR)
	echo "[Done]: You're ready to rock \m/"