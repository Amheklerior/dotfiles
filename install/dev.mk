.PHONY: dev setup-node personal work

.DEFAULT_GOAL := dev


dev: setup-node personal work

# installing lts and latest version of node via fnm
# NOTE: at the moment, node versions are: v22.2.0 (latest), and v20.13.1 (LTS) 
setup-node: 
	echo "$(DEV_LOG) setup node env..."
	fnm install --lts
	fnm install --latest
	fnm alias 20 lts
	fnm alias 22 latest
	fnm use latest

personal:
	echo "$(DEV_LOG) clone my personal repos..."

work:
	echo "$(DEV_LOG) clone work related repos..."
