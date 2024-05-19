# dotfiles

This are my personal dotfiles.

> [!NOTE] \
> It targets macOS systems only for now.

## Installation

> [!WARNING] \
> **_WARNING: Use at your own risk!_** \
> _If you want to use these dotfiles, feel free to do it, but please don't do it blindly. You should first fork the repo, review the code, and remove anything you don't want or need._

The installation process is _idempotent_, which means that running it once or multiple times produce the same end result.

To automatically install these dotfiles on a brand new system, simply run the following shell commands:

```sh
# clone this dotfile repository
git clone https://github.com/Amheklerior/dotfiles $HOME/.dotfiles

# move into the .dotfiles directory
cd $HOME/.dotfiles

# run preliminary steps
make prepare

# install all dotfiles
make bootstrap
```

> [!TIP] \
> If you're interested in what the last two commands do, have a look at the [`makefile`]().

## Packages

Packages are installed via [`homebrew`](https://brew.sh/).

TODO

## Dotfiles

Dotfiles are not copied, but symlinked using [`GNU Stow`](https://www.gnu.org/software/stow/).

TODO

## Sensitive Data

Sensitive data are protected by encryption, using [`ansible-vault`](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

```sh
# it will prompt to create a password...
ansible-vault encrypt <sensitive-data>

# it will prompt for the password used for encryption...
ansible-vault decrypt <private-key>
```

### SSH keys

SSH key pairs are stored under the `/ssh-keys` directory. The private keys are stored encrypted, while the public ones are stored as is.

### Backup codes

Backup codes for apps/services are stored encrypted in a `*.codes` file under the `/recover-codes` directory.
