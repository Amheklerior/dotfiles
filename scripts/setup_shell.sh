#!/bin/zsh

local LOG_PREFIX="[setup shell]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES/scripts/utils.sh"

local _is_ZSH_the_default_sys_shell() {
  test $(grep -Fxq $HOMEBREW_BIN_PATH/zsh /etc/shells)
}

local _is_ZSH_the_default_login_shell() {
  test $SHELL = $HOMEBREW_BIN_PATH/zsh
}

# set ZSH as the default system shell
if ! _is_ZSH_the_default_sys_shell; then
	_log "$LOG_PREFIX change default system shell to zsh..."
	echo $HOMEBREW_BIN_PATH/zsh | sudo tee -a /etc/shells >/dev/null
else
  _log "$LOG_PREFIX system shell already set to zsh"
fi

# set ZSH as the default login shell
if ! _is_ZSH_the_default_login_shell; then
	_log "$LOG_PREFIX change default login shell to zsh..."
	chsh -s $(HOMEBREW_BIN_PATH)/zsh
else
  _log "$LOG_PREFIX login shell already set to zsh"
fi

# update `sh` symlink to points to zsh instead of bash
if ! sh --version | grep -q zsh; then
	_log "$LOG_PREFIX update sh symlink from bash to zsh..."
	sudo ln -sfv /bin/zsh /var/select/sh
else
  _log "$LOG_PREFIX sh symlink already points to zsh"
fi