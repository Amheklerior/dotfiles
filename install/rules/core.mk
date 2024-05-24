.PHONY: core zsh ssh git default-user-shell sh-symlink

.DEFAULT_GOAL := core


core: zsh ssh git

zsh: default-user-shell sh-symlink

# make the updated version of zsh the default shell when I open a new terminal.
# NOTE: homebrew version of zsh must be added to the list of recognised shells, otherwise the chsh command would not allow the update 
default-user-shell: packages
	echo "$(CORE_LOG) change default shell to zsh..."
	if ! grep -Fxq $(HOMEBREW_ZSH_PATH) $(SYS_SHELLS); then \
		echo $(HOMEBREW_ZSH_PATH) | sudo tee -a $(SYS_SHELLS) >/dev/null; \
	fi
	if [ $$SHELL != $(HOMEBREW_ZSH_PATH) ]; then \
		chsh -s $(HOMEBREW_ZSH_PATH); \
	fi

# update sh symlink to points to zsh instead of bash 
# NOTE: could not symlink to /opt/homebrew/bin/zsh, linked it to the preinstalled /bin/zsh instead
sh-symlink:
	echo "$(CORE_LOG) update sh symlink from bash to zsh..."
	if ! sh --version | grep -q zsh; then \
		sudo ln -sfv /bin/zsh /var/select/sh; \
	fi

ssh: packages
	echo "$(CORE_LOG) copy ssh keys..."
	mkdir -p ${HOME}/.ssh
	cp $(SSH_KEYS)/* ${HOME}/.ssh 
	ansible-vault decrypt ${HOME}/.ssh/personal ${HOME}/.ssh/work

git: 
	echo "$(CORE_LOG) setup git and git-lfs..."
