.PHONY: core ssh git github-login gitlab-login mk-tmp-dir

.DEFAULT_GOAL := core


core: prompt ssh git

git: prompt github-login gitlab-login

# NOTE: it checks the .ssh/ dir presence, under the assumption
# that it won't be created prior to the ssh-keys copy operation. 
ssh: prompt ansible
	if [ ! -d ${HOME}/.ssh ]; then \
		echo "$(CORE_LOG) setting up ssh keys on your system..."; \
		mkdir -p ${HOME}/.ssh; \
		cp $(SSH_KEYS)/* ${HOME}/.ssh && \
		ansible-vault decrypt ${HOME}/.ssh/personal ${HOME}/.ssh/work; \
	else \
		echo "$(CORE_LOG) ssh keys already present!"; \
	fi

# login to gh via access token
github-login: mk-tmp-dir
	if ! gh auth status >/dev/null 2>&1; then \
		cp ./backup-codes/github.token ${XDG_DATA_HOME}/gh-login-token; \
		echo "$(DEV_LOG) please enter the decryption password for copying the gh login token"; \
		ansible-vault decrypt ${XDG_DATA_HOME}/gh-login-token && \
		cat ${XDG_DATA_HOME}/gh-login-token | pbcopy && \
		echo "$(DEV_LOG) token successfully copeid on your clipboard! Paste it during the installation process..." && \
		gh auth login; \
		rm ${XDG_DATA_HOME}/gh-login-token; \
	else \
		echo "$(DEV_LOG) already logged in into github"; \
	fi

# login to glab via access token
gitlab-login: mk-tmp-dir
	if ! glab auth status >/dev/null 2>&1; then \
		cp ./backup-codes/gitlab.token ${XDG_DATA_HOME}/glab-login-token; \
		echo "$(DEV_LOG) please enter the decryption password for copying the glab login token"; \
		ansible-vault decrypt ${XDG_DATA_HOME}/glab-login-token && \
		cat ${XDG_DATA_HOME}/glab-login-token | pbcopy && \
		echo "$(DEV_LOG) token successfully copeid on your clipboard! Paste it during the installation process..." && \
		glab auth login; \
		rm ${XDG_DATA_HOME}/glab-login-token; \
	else \
		echo "$(DEV_LOG) already logged in into gitlab"; \
	fi

mk-tmp-dir:
	mkdir -p ${XDG_DATA_HOME}
