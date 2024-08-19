include ${HOME}/.dotfiles/install/configs/env.mk

.PHONY: help fmt-iterm-profile link unlink relink clean check-links restore view-backup

ITERM_PROFILE := $(DOTFILES)/prefs/iterm2/profile.json
LINKED_FILES := \
	${HOME}/.zshrc \
	${HOME}/.zprofile \
	${HOME}/.zshenv \
	${HOME}/.zalias \
	${HOME}/.zfunc \
	${HOME}/.gitconfig \
	${HOME}/.ssh/config \
	${HOME}/.ssh/known_hosts \
	${HOME}/.config/starship.toml \
	${HOME}/.config/.bunfig.toml \
	${HOME}/bin \
	${HOME}/Library/Application\ Support/Code/User/settings.json

# use zsh to interpret the recipes
SHELL := /bin/zsh

help: 
	head $(DOTFILES)/dev.mk | grep ".PHONY:" | sed -e "s/\.PHONY: //" -e "s/ /\n/g"

fmt-iterm-profile: 
	echo "$(DEV_LOG) ordering keys in the iterm's profile.json..."
	jq -S . $(ITERM_PROFILE) > tmp.json && mv tmp.json $(ITERM_PROFILE)

link:
	echo "$(DEV_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} -S .

unlink:
	echo "$(DEV_LOG) unlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} -D .

relink:
	echo "$(DEV_LOG) relinking dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} -R .

clean: 
	rm $(LINKED_FILES)

# NOTE: it just list all the dotfiles (they should all appear as symlinks)
check-links:
	eza --all --long --list-dirs --classify --header --icons --group-directories-first $(LINKED_FILES)

# copies all files/dirs from the backup dir back into their original position
restore:
	echo "$(DEV_LOG) restoring backed up dotfiles..."
	for item in $(STOW_ITEMS); do \
		if [[ -f "$(BACKUP_DIR)/$$item" ]]; then \
			cp -f $(BACKUP_DIR)/$$item ${HOME}/$$item; \
		fi; \
		if [[ -d "$(BACKUP_DIR)/$$item" ]]; then \
			mkdir -p ${HOME}/$$item && \
			cp -f $(BACKUP_DIR)/$$item/* ${HOME}/$$item; \
		fi; \
	done

# a tree view of the backed up original dotfiles
view-backup:
	eza --tree -L2 --all --classify --header --icons --group-directories-first $(BACKUP_DIR)	