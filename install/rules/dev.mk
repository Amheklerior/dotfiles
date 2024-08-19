.PHONY: dev setup-node personal work github-login gitlab-login

.DEFAULT_GOAL := dev


dev: setup-node personal work

# setup fnm and corepack install dirs, and install lts and latest version of node
# NOTE: at the moment, node versions are: v22.2.0 (latest), and v20.13.1 (LTS) 
setup-node: 
	echo "$(DEV_LOG) setup node env..."
	mkdir -p $(FNM_INSTALL_DIR) $(COREPACK_INSTALL_DIR)
	if [[ ! $$(fnm list | grep -q lts) ]]; then \
		fnm install --lts && fnm alias 20 lts; \
	fi
	if [[ ! $$(fnm list | grep -q latest) ]]; then \
		fnm install --latest && fnm alias 22 latest; \
	fi
	fnm use latest

# clone personal projects
personal: github-login
	echo "$(DEV_LOG) creating the ~/personal dir..."
	mkdir -p $(PERSONAL_DIR) $(XDG_DATA_HOME)
	echo "$(DEV_LOG) clone my personal repos..."
	if [[ ! -e ${XDG_DATA_HOME}/personal-repo ]]; then \
		cp $(PERSONAL_REPO_LIST) ${XDG_DATA_HOME}/personal-repo; \
		ansible-vault decrypt ${XDG_DATA_HOME}/personal-repo; \
	fi
	while IFS=' ' read -r repo path; do \
		if [[ ! -e $(PERSONAL_DIR)/$$path ]]; then \
			gh repo clone $$repo $(PERSONAL_DIR)/$$path || echo "$(DEV_LOG) Failed to clone: $$repo"; \
		else \
			echo "$(DEV_LOG) $$repo is already present, skipped!"; \
		fi; \
	done < ${XDG_DATA_HOME}/personal-repo

# clone work projects
work: gitlab-login
	echo "$(DEV_LOG) creating the ~/work dir..."
	mkdir -p $(WORK_DIR) $(XDG_DATA_HOME)
	echo "$(DEV_LOG) clone work related repos..."
	if [[ ! -e ${XDG_DATA_HOME}/work-repo ]]; then \
		cp $(WORK_REPO_LIST) ${XDG_DATA_HOME}/work-repo; \
		ansible-vault decrypt ${XDG_DATA_HOME}/work-repo; \
	fi
	while IFS=' ' read -r repo path; do \
		if [[ ! -e $(WORK_DIR)/$$path ]]; then \
			glab repo clone $$repo $(WORK_DIR)/$$path || echo "$(DEV_LOG) Failed to clone: $$repo"; \
		else \
			echo "$(DEV_LOG) $$repo is already present, skipped!"; \
		fi; \
	done < ${XDG_DATA_HOME}/work-repo

github-login: brew-bundle
	if ! gh auth status >/dev/null 2>&1; then \
		cp ./backup-codes/github.token ${XDG_DATA_HOME}/gh-login-token; \
		echo "Please enter the decryption password for copying the gh login token"; \
		ansible-vault decrypt ${XDG_DATA_HOME}/gh-login-token && \
		cat ${XDG_DATA_HOME}/gh-login-token | pbcopy; \
		echo "Token copeid! Paste it during the installation process..."; \
		gh auth login; \
	fi

gitlab-login: brew-bundle
	if ! glab auth status >/dev/null 2>&1; then \
		cp ./backup-codes/gitlab.token ${XDG_DATA_HOME}/glab-login-token; \
		echo "Please enter the decryption password for copying the glab login token"; \
		ansible-vault decrypt ${XDG_DATA_HOME}/glab-login-token && \
		cat ${XDG_DATA_HOME}/glab-login-token | pbcopy; \
		echo "Token copeid! Paste it during the installation process..."; \
		glab auth login; \
	fi
