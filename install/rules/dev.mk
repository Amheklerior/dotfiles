.PHONY: dev setup-node personal work

.DEFAULT_GOAL := dev


dev: prompt setup-node personal work

# setup fnm and corepack install dirs, and install lts and latest version of node
# NOTE: at the moment, node versions are: v22.2.0 (latest), and v20.13.1 (LTS) 
setup-node: 
	echo "$(DEV_LOG) setting up node env..."
	mkdir -p $(FNM_INSTALL_DIR) $(COREPACK_INSTALL_DIR)
	if [[ ! $$(fnm list | grep -q lts) ]]; then \
		fnm install --lts && fnm alias 20 lts; \
	fi
	if [[ ! $$(fnm list | grep -q latest) ]]; then \
		fnm install --latest && fnm alias 22 latest; \
	fi

# clone personal projects
personal: github-login
	echo "$(DEV_LOG) creating the ~/personal dir..."
	mkdir -p $(PERSONAL_DIR)
	echo "$(DEV_LOG) clone my personal repos..."
	if [[ ! -e ${XDG_DATA_HOME}/personal-repo ]]; then \
		cp $(PERSONAL_REPO_LIST) ${XDG_DATA_HOME}/personal-repo; \
		echo "$(DEV_LOG) provide decryption password to access your personal repo list..."; \
		ansible-vault decrypt ${XDG_DATA_HOME}/personal-repo; \
	fi
	while IFS=' ' read -r repo path; do \
		if [[ ! -e $(PERSONAL_DIR)/$$path ]]; then \
			gh repo clone $$repo $(PERSONAL_DIR)/$$path || echo "$(DEV_LOG) Failed to clone: $$repo"; \
		else \
			echo "$(DEV_LOG) $$repo is already present, skipped!"; \
		fi; \
	done < ${XDG_DATA_HOME}/personal-repo
	rm ${XDG_DATA_HOME}/personal-repo

# clone work projects
work: gitlab-login
	echo "$(DEV_LOG) creating the ~/work dir..."
	mkdir -p $(WORK_DIR)
	echo "$(DEV_LOG) clone work related repos..."
	if [[ ! -e ${XDG_DATA_HOME}/work-repo ]]; then \
		cp $(WORK_REPO_LIST) ${XDG_DATA_HOME}/work-repo; \
		echo "$(DEV_LOG) provide decryption password to access your work repo list..."; \
		ansible-vault decrypt ${XDG_DATA_HOME}/work-repo; \
	fi
	while IFS=' ' read -r repo path; do \
		if [[ ! -e $(WORK_DIR)/$$path ]]; then \
			glab repo clone $$repo $(WORK_DIR)/$$path || echo "$(DEV_LOG) Failed to clone: $$repo"; \
		else \
			echo "$(DEV_LOG) $$repo is already present, skipped!"; \
		fi; \
	done < ${XDG_DATA_HOME}/work-repo
	rm ${XDG_DATA_HOME}/work-repo
