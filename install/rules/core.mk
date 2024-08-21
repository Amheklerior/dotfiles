.PHONY: core shell ssh make-default-user-shell sh-symlink

.DEFAULT_GOAL := core


core: shell ssh

shell: make-default-user-shell sh-symlink

# make the updated version of zsh the default shell when I open a new terminal.
# NOTE: homebrew version of zsh must be added to the list of recognised shells,
# otherwise the chsh command would not allow the update 
make-default-user-shell: zsh
	if ! grep -Fxq $(HOMEBREW_BIN_PATH)/zsh $(SYS_SHELLS); then \
		echo "$(CORE_LOG) change default system shell to zsh..."; \
		echo $(HOMEBREW_BIN_PATH)/zsh | sudo tee -a $(SYS_SHELLS) >/dev/null; \
	fi
	if [[ $$SHELL != $(HOMEBREW_BIN_PATH)/zsh ]]; then \
		echo "$(CORE_LOG) change default login shell to zsh..."; \
		chsh -s $(HOMEBREW_BIN_PATH)/zsh; \
	fi

# update sh symlink to points to zsh instead of bash 
# NOTE: could not symlink to /opt/homebrew/bin/zsh,
# linked it to the preinstalled /bin/zsh instead
sh-symlink: zsh
	if ! sh --version | grep -q zsh; then \
		echo "$(CORE_LOG) update sh symlink from bash to zsh..."; \
		sudo ln -sfv /bin/zsh /var/select/sh; \
	fi

# NOTE: it checks the .ssh/ dir presence, under the assumption
# that it won't be created prior to the ssh-keys copy operation. 
ssh: ansible
	if [ ! -d ${HOME}/.ssh ]; then \
		echo "$(CORE_LOG) setting up ssh keys on your system..."; \
		mkdir -p ${HOME}/.ssh; \
		cp $(SSH_KEYS)/* ${HOME}/.ssh && \
		ansible-vault decrypt ${HOME}/.ssh/personal ${HOME}/.ssh/work; \
	else \
		echo "$(CORE_LOG) ssh keys already present!"; \
	fi
