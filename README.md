# dotfiles

This is my personal dotfiles repo. Feel free to explore it, copy bits and pieces for your own dotfiles, or fork the whole repo and use them.

> **! NOTE**\
> It only targets macOS systems for now.

> **⚠ WARNING**\
> These dotfiles are tailored to my liking to help me manage my macos laptops. If you want to use them, fork the repo, review the code, remove anything you don't want or need, and enjoy.

## Installation

The installation process is _idempotent_, which means that running it once or multiple times produce the same end result.

To automatically install these dotfiles on a brand new system, simply run the following shell commands:

```sh
# clone this dotfile repository
git clone https://github.com/Amheklerior/dotfiles $HOME/.dotfiles

# move into the .dotfiles directory
cd $HOME/.dotfiles

# run the install script
./install
```

If you're interested in what the last two commands do, have a look at the [`makefile`](/makefile).

After that, you are all set. You might now [import system and app related preferences](/docs/prefs/prefs.md)

## How it Works

The pillars are **`Homebrew`**, **`Ansible`**, **`GNU Stow`**, and **`GNU Make`**.

[Homebrew](https://brew.sh/) is at the core of how I manage all the _packages_, _apps_, and _vscode extensions_. They are all listed in the [Brewfile](/install/bundles/Brewfile), and installed in bulk during the first steps of the installation process.

[GNU Stow](https://www.gnu.org/software/stow/) is used to to symlink all of my dotfiles from the [`/system`](/system/) dir into the `$home` dir.

[Ansible Vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html) is used to protect [sensitive information](/docs/sensitive-data.md) contained in this repo, such as apps and services recovery codes and ssh keys.

[GNU Make](https://www.gnu.org/software/make/manual/make.html) is what I've used to define (1) the [automated installation process](/makefile) and (2) the [development utilities](/dev.mk) for managing the dotfiles repo. In the future, I might use [Ansible Playbooks](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html) as an alternative to the makefile for automating the installation process, and a simple cli for managing the repo.

System and app related preferences are stored in the [`/prefs`](/prefs/) directory.

## Feedback

If you have any suggestion/improvement [be my guest](https://github.com/Amheklerior/dotfiles/issues)!

## Credits

Special thanks to the [github's dotfiles community](https://dotfiles.github.io/) which has been a great source of ideas and inspiration, to [Michael Paulson (aka The Primeagen)](https://www.youtube.com/c/ThePrimeagen) for his [_developer productivity_ course](https://frontendmasters.com/courses/developer-productivity/), and to [Patrick Mcdonald](https://twitter.com/eieioxyz) for his [_dotfiles from start to finish-ish_ course](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/).
