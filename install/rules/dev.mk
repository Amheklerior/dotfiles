.PHONY: dev setup-node personal work

.DEFAULT_GOAL := dev


dev: setup-node personal work

# setup fnm and corepack install dirs, and install lts and latest version of node
# NOTE: at the moment, node versions are: v22.2.0 (latest), and v20.13.1 (LTS) 
setup-node: 
	echo "$(DEV_LOG) setup node env..."
	mkdir -p $(FNM_INSTALL_DIR) $(COREPACK_INSTALL_DIR)
	if fnm list | grep -q lts; then \
		fnm install --lts && fnm alias 20 lts; \
	fi
	if fnm list | grep -q latest; then \
		fnm install --latest && fnm alias 22 latest; \
	fi
	fnm use latest

# clone personal projects
personal:
	echo "$(DEV_LOG) creating the ~/personal dir..."
	mkdir -p $(PERSONAL_DIR)
	echo "$(DEV_LOG) clone my personal repos..."
	cp $(PERSONAL_REPO_LIST) $(PERSONAL_REPO_LIST_DECRYPTED)
	ansible-vault decrypt $(PERSONAL_REPO_LIST_DECRYPTED)
	while IFS=' ' read -r repo path; do \
		if [ ! -e $(PERSONAL_DIR)/$$path ]; then \
			gh repo clone $$repo $(PERSONAL_DIR)/$$path || echo "$(DEV_LOG) Failed to clone: $$repo"; \
		else \
			echo "$(DEV_LOG) $$repo is already present, skipped!"; \
		fi; \
	done < $(PERSONAL_REPO_LIST_DECRYPTED)
	rm $(PERSONAL_REPO_LIST_DECRYPTED)

# clone work projects
work:
	echo "$(DEV_LOG) creating the ~/work dir..."
	mkdir -p $(WORK_DIR)
	echo "$(DEV_LOG) clone work related repos..."
	cp $(WORK_REPO_LIST) $(WORK_REPO_LIST_DECRIPTED)
	ansible-vault decrypt $(WORK_REPO_LIST_DECRIPTED)
	while IFS=' ' read -r repo path; do \
		if [ ! -e $(WORK_DIR)/$$path ]; then \
			glab repo clone $$repo $(WORK_DIR)/$$path || echo "$(DEV_LOG) Failed to clone: $$repo"; \
		else \
			echo "$(DEV_LOG) $$repo is already present, skipped!"; \
		fi; \
	done < $(WORK_REPO_LIST_DECRIPTED)
	rm $(WORK_REPO_LIST_DECRIPTED) 