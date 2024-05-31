# dotfiles

This are my personal dotfiles.

> **! NOTE**\
> It only targets macOS systems at the moment.

## Installation

> **⚠ WARNING**\
> Use at your own risk! If you want to use these dotfiles, feel free to do so, but be careful. First fork the repo, review the code, and remove anything you don't want or need.

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

After that, go to `iterm2 > Settings > Preferences` and link the iterm2 preferences, as shown below.

![iterm2 prefs](./docs/iterm2%20prefs.png)

## Homebrew

[`homebrew`](https://brew.sh/) is the core tool used to install packages, applications, and vscode extensions, defined in the [Brewfile](./install/bundles/Brewfile).

Run the following commands to check the current status of the system against the Brewfile:

```sh
# compare installed formulae with the Brewfile list
brewdiff

# compare installed apps with the Brewfile list
appdiff

# compare installed vscode extentions with the Brewfile list
codediff
```

## Dotfiles

Dotfiles are defines in the [`/system`](./system/) directory, and are symlinked using [`GNU Stow`](https://www.gnu.org/software/stow/).

They contains configuration for `ssh`, `git`, and the `shell`.

## Sensitive Data

Sensitive data are protected by encryption, using [`ansible-vault`](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

```sh
# it will prompt to create a password...
ansible-vault encrypt <sensitive-data>

# it will prompt for the password used for encryption...
ansible-vault decrypt <sensitive-data>
```

### SSH keys

SSH key pairs are stored under the [`/ssh-keys`](/ssh-keys/) directory. The private keys are stored encrypted, while the public ones are stored as is.

### Backup codes

Backup codes for apps/services are stored encrypted in a `*.codes` file under the [`/backup-codes`](/backup-codes/) directory.

## Credits

Special thanks to the [github's dotfiles community](https://dotfiles.github.io/) which has been a great source of ideas and inspiration, to [Michael Paulson (aka The Primeagen)](https://www.youtube.com/c/ThePrimeagen) for his [_developer productivity_ course](https://frontendmasters.com/courses/developer-productivity/), and to [Patrick Mcdonald](https://twitter.com/eieioxyz) for his [_dotfiles from start to finish-ish_ course](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/).
