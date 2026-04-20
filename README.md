# Amheklerior's Dotfiles

These are my personal dotfiles. They contains my shell and terminal settings for MacOS (what I currently use),
as well as git and neovim configurations.

> [!IMPORTANT]
> Don’t blindly use my settings unless you know what that entails. Use at your own risk!
> If you want to give them a try, [fork](https://github.com/Amheklerior/dotfiles/fork)
> the repo, review the content, and remove anything you don't want or need.

## Getting Started

To install these dotfiles into a brand new machine, simply run the command:

```sh
# first, create the folder structure to prevent GNU stow from linking the
# directories rather than their content.
mkdir -p ~/.config

# then symlink them using stow
# TIP: can use the -R flag instead of the -S to (R)elink them
stow -d <this-repo-path>/home -t $HOME . -S
```

If you don't like/want the dependency on `stow`, you can symlink manually using the `ln` command
or make hard copies if you are into that sort of thing.

## Repo Structure

The actual dotfiles are contained within the [`home/`](/home/) dir, which replicates the same structure of
the `$HOME` system directory. I chose to do so (over a _topical_ approach for example) to optimize for ease
of management/maintenance over clean content segregation. In fact, I use [GNU Stow](https://www.gnu.org/software/stow/)
to symlink the dotfiles on new systems.

```ruby
home/
├── .config/
│   ├── delta/themes.config # delta diff tool color themes
│   ├── ghostty/config # ghostty terminal prefs
│   ├── nvim/ # nvim lua configs (submodule)
│   └── starship.toml # my shell prompts settings
├── .gitconfig # my global git configs
│
│   # all my shell's settings
├── .zalias
├── .zfunc
├── .zprofile
├── .zshenv
└── .zshrc
```

- [`delta/themes.config`](./home/.config/delta/themes.config) - color theme definitions for the [delta](https://github.com/dandavison/delta) diff tool
- [`ghostty/config`](./home/.config/ghostty/config) - settings for the [Ghostty](https://ghostty.org) terminal emulator
- [`starship.toml`](./home/.config/starship.toml) - my shell prompt configurations via [Starship](https://starship.rs)
- [`nvim/`](./home/.config/nvim) - my [Neovim](https://neovim.io) lua configurations as a git submodule (see [`Amheklerior/nvim`](https://github.com/Amheklerior/nvim))
- [`.gitconfig`](./home/.gitconfig) - my global git configurations
- [`.zalias`](./home/.zalias), [`.zfunc`](./home/.zfunc) - my custom shell aliases and functions
- [`.zprofile`](./home/.zprofile), [`.zshenv`](./home/.zshenv), [`.zshrc`](./home/.zshrc) - my main shell configuration

## The Bigger Picture

They are part of my [System Environment Setup](https://github.com/Amheklerior/sysenv)
for quickly setting up new machines.
