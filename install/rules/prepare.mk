.PHONY: prepare sys-check cli-dev-tools backup

.DEFAULT_GOAL := prepare


prepare: sys-check cli-dev-tools backup

# check whether it's running on a macos system (the only supported so far)
sys-check: 
	echo "$(PREPARE_LOG) check system os..."
	if [ "$(SYSTEM)" == "Darwin" ]; then \
		echo "sys-check: OK!"; \
	else \
		echo "sys-check: KO! It only works on macos" && exit 1; \
	fi

# install the macos command line dev tools 
# TODO: find a way to automate installation without user intervention (this prompt a dialog)
cli-dev-tools: 
	echo "$(PREPARE_LOG) install cli dev tools..."
	xcode-select -p >/dev/null || xcode-select --install
	read "Hit enter when you complete the command line dev tools installation process..."

# move any file/dir which is NOT a symlink into the backup directory
backup: 
	echo "$(PREPARE_LOG) backup currently present dotfiles..."
	mkdir -p $(BACKUP_DIR)/.config
	for item in $(STOW_ITEMS); do \
		if [ -e "${HOME}/$$item" ] && [ ! -L "${HOME}/$$item" ]; then \
			mv -f ${HOME}/$$item $(BACKUP_DIR); \
		fi; \
	done
