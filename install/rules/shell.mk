.PHONY: shell make-default-user-shell sh-symlink shell-plugins

.DEFAULT_GOAL := shell

shell: make-default-user-shell sh-symlink shell-plugins

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

# For all plugins that are not supported by brew yet, clone them manually into the .config/plugins dir
shell-plugins: github-login
  echo "$(CORE_LOG) Do you want to install shell plugins? (y/n)" && read -r REPLY; \
	if [[ $$REPLY != "y" && $$REPLY != "Y" ]]; then \
		echo "$(CORE_LOG) Skipping shell plugins installation"; \
		exit 0; \
	fi; \
	echo "$(CORE_LOG) install shell plugins..."; \
	mkdir -p $(XDG_CONFIG_HOME)/plugins; \
	while IFS=' ' read -r plugin repo; do \
		if [[ ! -e $(XDG_CONFIG_HOME)/plugins/$$plugin ]]; then \
			gh repo clone $$repo $(XDG_CONFIG_HOME)/plugins/$$plugin || echo "$(CORE_LOG) Failed to clone: $$plugin"; \
		else \
			echo "$(CORE_LOG) $$plugin is already present, skipped!"; \
		fi; \
	done < $(SHELL_PLUGINS_LIST)
