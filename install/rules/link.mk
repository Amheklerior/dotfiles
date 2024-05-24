.PHONY: link unlink

.DEFAULT_GOAL := link


link: packages
	echo "$(STOW_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} .

unlink: packages
	echo "$(STOW_LOG) unlink dotfiles..."
	stow -D -d $(DOTFILES)/system -t ${HOME} .
