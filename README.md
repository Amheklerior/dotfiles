# dotfiles repo

This is my personal dotfiles repo. Feel free to explore it, copy bits and pieces for your own dotfiles, or fork the whole repo.

> **! NOTE**\
> These dotfiles are tailored to my liking. If you want to use them, fork the repo, review the code, remove anything you don't want or need, and enjoy.

## Platform Compatibility ⚠

This repository is currently tailored for macOS systems only.

Dotfiles might work with little/no changes on other systems (although no test has been performed to confirm that, so far). The installation process will more likely require more effort, as it is thoroughly tailored on macOS systems.

It's my intention to make it crossplatform one day, but it will require major changes: like switching from `homebrew` to `Nix` as a system package manager, and adapting all system and app preferences automation script.

## Installation process

The installation process is largely automated, with only a few manual steps involved.

In a nutshell, to install the dotfiles on a brand new system, simply run the following shell commands:

```sh
# install the command line dev tools
xcode-select --install 

# clone this dotfile repository
git clone https://github.com/Amheklerior/dotfiles $HOME/.dotfiles

# move into the .dotfiles directory
cd $HOME/.dotfiles

# run the install script and follow the instructions...
./bootstrap.sh

```

For a step-by-step reference guide in setting up a new machine, checkout the [stup-guide](/docs/setup-guide.md) and the [system and apps preferences](/docs/prefs.md) page.

## Repository Overview

Here's an overview of the repository structure

- [**`bootstrap.sh`**](./bootstrap.sh) - the main script that is used to automate the installation process (it calls in order, all scripts defined in the `scripts/` dir below)
- [**`scripts/`**](./scripts/) - scripts that are used to automate the installation process
- [**`bundles/`**](./bundles/)
  - [**`packages.bundle`**](/bundles/packages.bundle) - list of all packages to be installed
  - [**`fonts.bundle`**](/bundles/fonts.bundle) - list of all fonts to be installed
  - [**`apps.bundle`**](/bundles/apps.bundle) - list of all cask and mac app store's apps to be installed
  - [**`vscode.bundle`**](/bundles/vscode.bundle) - list of all vscode extensions to be installed
  - [**`shell-plugins.list`**](/bundles/shell-plugins.list) - list of all shell plugins to be installed
  - [**`personal-repos.list`**](/bundles/personal-repos.list) - list of all personal git repos to be cloned
  - [**`work-repos.list`**](/bundles/work-repos.list) - list of all work related git repos to be cloned
- [**`prefs/`**](./prefs/)
  - [**`apps/`**](./prefs/apps/) - scripts to load preferences for the various apps
  - [**`macos/`**](./prefs/macos/) - script to load macos system preferences
  - [**`raycast/`**](./prefs/raycast/) - raycast's config file
  - [**`vscode/`**](./prefs/vscode/) - vscode settings, keybindings, and snippets
  - [**`kbd/`**](./prefs/kbd/) - keyboard layout and mappings for my Nuphy Air75 keyboard
- [**`private/`**](./private/) - sensitive data like 2FA codes, keys, and tokens, all encrypted
- [**`ssh-keys`**](./ssh-keys/) - ssh key pairs for both personal and work accounts
- [**`system/`**](./system/) - dotfiles that are symlinked into the user's home dir
- [**`bin/`**](./bin/) - scripts and utilities that are available in the PATH
- [**`wallpaper/`**](./wallpaper/) - a set of nice wallpapers for my mac

## My dotfiles

My dotfiles are stored under the [`/system`](/system/) directory. They are symlinked into the user's `$HOME` dir using [`GNU stow`](https://www.gnu.org/software/stow/). This makes it easy to update them without having to manually synk them between the system and the repo.

## How private information are protected

Sensitive and private data, such as 2FA backup codes, SSH private keys, GitHub/GitLab access tokens, licence keys, personal and work related git repo lists, are all  encrypted and protected with a password, using [`ansible-vault`](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

SSH key pairs are safely stored under the [`/ssh-keys`](/ssh-keys/) directory. The private keys are stored encrypted, while the public ones are stored as is.

2FA codes, keys, and tokens for apps/services are stored encrypted in a `*.codes`, `*.key`, `*.token` file respectively, under the [`/private`](/private/) directory.

## Feedback

If you have any suggestion/improvement [be my guest](https://github.com/Amheklerior/dotfiles/issues)!

## Credits

Special thanks to:

- the [github's dotfiles community](https://dotfiles.github.io/) which has been a great source of ideas and inspiration
- [Michael Paulson (aka The Primeagen)](https://www.youtube.com/c/ThePrimeagen) for his [_developer productivity_ course](https://frontendmasters.com/courses/developer-productivity/)
- [Patrick Mcdonald](https://twitter.com/eieioxyz) for his [_dotfiles from start to finish-ish_ course](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/)
- [Mathia's macos sensible default settings](https://github.com/mathiasbynens/dotfiles/blob/main/.macos), and [macos-defaults.com](https://macos-defaults.com/), used as reference for automating macos system settings, and [`plistwatch`](https://github.com/catilac/plistwatch) which made easier to experiment with, and iterate over, system and app's settings.
