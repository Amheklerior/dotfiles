# My Personal Dotfiles

This repo contains my personal dotfiles for shell and terminal configurations.

## Platform Compatibility ⚠

The dotfiles are designed and tested on macOS only (which is what I currently use).
However, it should be easy to adapt them to a generic Unix system (for example,
the update in the system package manager used).

## Install

To install these dotfiles into a brand new machine, simply run the command:

```sh
# first, create the folder structure to prevent GNU stow from linking the
# directories rather than their content.
mkdir -p $XDG_CONFIG_HOME

# then symlink them using stow
stow -d <this-repo-path>/home -t $HOME . -S

# alternatively, you can relink already previously linked ones
stow -d <this-repo-path>/home -t $HOME . -R
```

The above requires [GNU Stow](https://www.gnu.org/software/stow/) to be installed on your system.
If not already present, install it with `brew install stow`.

### An Alternative Approach (copying)

If you prefer to have hard copies on your system, simply copy the `home/` directory content into your `$HOME` dir.

```sh
cp -R <this-repo-path>/home $HOME
```

## Repo Structure

The repo contains only one directory - the [`home/`](/home/) dir - which is where the actual dotfiles are stored.

```ruby
home/
├── .config/
│   ├── ...
│   ├── ghostty/config # ghotty terminal prefs
│   └── starship.toml # my shell prompts settings
├── .gitconfig # global git configs
│
│   # all my shell's settings
├── .zalias 
├── .zfunc
├── .zprofile
├── .zshenv
└── .zshrc

```

The `home/` dir replicates the same structure of the `$HOME` system directory.
This is done in order to simplify symlinking them with `stow`.
