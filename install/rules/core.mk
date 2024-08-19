.PHONY: core shell ssh make-default-user-shell sh-symlink

.DEFAULT_GOAL := core


core: shell ssh

shell: make-default-user-shell sh-symlink

# make the updated version of zsh the default shell when I open a new terminal.
# NOTE: homebrew version of zsh must be added to the list of recognised shells, otherwise the chsh command would not allow the update 
make-default-user-shell: zsh
	echo "$(CORE_LOG) change default shell to zsh..."
	if ! grep -Fxq $(HOMEBREW_BIN_PATH)/zsh $(SYS_SHELLS); then \
		echo $(HOMEBREW_BIN_PATH)/zsh | sudo tee -a $(SYS_SHELLS) >/dev/null; \
	fi
	if [ $$SHELL != $(HOMEBREW_BIN_PATH)/zsh ]; then \
		chsh -s $(HOMEBREW_BIN_PATH)/zsh; \
	fi

# update sh symlink to points to zsh instead of bash 
# NOTE: could not symlink to /opt/homebrew/bin/zsh, linked it to the preinstalled /bin/zsh instead
sh-symlink: zsh
	echo "$(CORE_LOG) update sh symlink from bash to zsh..."
	if ! sh --version | grep -q zsh; then \
		sudo ln -sfv /bin/zsh /var/select/sh; \
	fi

ssh: ansible
	echo "$(CORE_LOG) setup ssh keys..."
	if [ ! -e ${HOME}/.ssh/{personal,work} ]; then \
		mkdir -p ${HOME}/.ssh; \
		cp $(SSH_KEYS)/* ${HOME}/.ssh; \
		ansible-vault decrypt ${HOME}/.ssh/personal ${HOME}/.ssh/work; \
	else \
		echo "$(CORE_LOG) ssh keys already present!"; \
	fi
