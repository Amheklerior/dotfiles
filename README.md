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

## Packages

Packages are installed via [`homebrew`](https://brew.sh/).

<!-- TODO -->

## Dotfiles

Dotfiles are not copied, but symlinked using [`GNU Stow`](https://www.gnu.org/software/stow/).

<!-- TODO -->

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
