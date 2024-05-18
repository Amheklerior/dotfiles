
.PHONY: bootstrap

bootstrap: prepare packages core link settings dev-env wrapup
	

prepare: 
	echo "Checking requirements..."
	echo "All good!"

packages: 
	echo "Installing all packages and apps..."

core: 
	echo "Setting up the system with the basics..."

link: 
	echo "Linking all dotfiles..."

settings:
	echo "Setting up all system preferences..."

dev-env: 
	echo "Setting up development specific goodies..."

wrapup:
	echo "Checks and cleanup..."
	echo "You're ready to rock \m/"