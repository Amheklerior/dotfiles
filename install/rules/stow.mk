.PHONY: dotfiles setdir link

.DEFAULT_GOAL := dotfiles


dotfiles: prompt setdir link

# create directories to let stow symlink their content individually,
# rather than the entire dir.
# NOTE: The .ssh/ dir should already be present with the ssh key pairs in it
setdir:
	if [[ ! -e ${HOME}/.config ]]; then \
		echo "$(STOW_LOG) creating the ~/.config dir"; \
		mkdir ${HOME}/.config; \
	fi

# if dotfiles are already present, relink them...
# NOTE: using only the .zshrc file as proxy for all dotfiles,
# since they are all linked in a single action
link: stow
	if [ ! -f ${HOME}/.zshrc ]; then \
		echo "$(STOW_LOG) symlinking dotfiles for the first time..."; \
		stow -d $(DOTFILES)/system -t ${HOME} . -S; \
	else \
		echo "$(STOW_LOG) relinking dotfiles..."; \
		stow -d $(DOTFILES)/system -t ${HOME} . -R; \
	fi