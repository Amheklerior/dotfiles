.PHONY: link

.DEFAULT_GOAL := link


link: stow
	echo "$(STOW_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} .
