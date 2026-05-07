# Amheklerior's Dotfiles

These are my personal dotfiles. They contains my shell and terminal settings for MacOS (what I currently use),
as well as git and neovim configurations.

> [!IMPORTANT]
> **Don’t blindly use my settings unless you know what that entails. Use at your own risk!**
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
of management/maintenance over clean content segregation. I use [GNU Stow](https://www.gnu.org/software/stow/)
to symlink the dotfiles on new systems, and it requires the files to have the same structure they should
have in the destination dir.

```ruby
home/
├── .config/
│   ├── delta/theme.gitconfig   # delta diff tool color theme
│   ├── ghostty/config.ghostty  # ghostty terminal prefs
│   ├── git/                    # git aliases, identities, and other specific configs
│   ├── nvim/                   # nvim lua configs (submodule)
│   ├── zsh/                    # shell tools setup files (bat/zoxide/etc...)
│   └── starship.toml           # cross-platform shell prompt settings
│
├── dev/personal/*              # markdownlint config for personal projects
├── .gitconfig                  # global git config
│
│   # shell configuration
├── .zalias
├── .zprofile
├── .zshenv
└── .zshrc
```

### zsh shell configs

I used to have one giant `.zshrc` file with all Zsh configurations in there.
Nowadays, I splitted it up into multiple files listed below (still gotta understand whether I actually like it or not tbh).

- **[`.zshenv`](home/.zshenv)** — loaded first for _all_ shells. Sets locale/language, [XDG base dirs](https://specifications.freedesktop.org/basedir-spec/latest/), global path variables (`$PERSONAL`, `$WORK`, `$DOTFILES_REPO`, …), and telemetry opt-out.
- **[`.zprofile`](home/.zprofile)** — loaded for _login_ shells only, after `.zshenv`. Bootstraps Homebrew, extends `$PATH`, and sets the default editor.
- **[`.zshrc`](home/.zshrc)** — loaded for _interactive_ shells. Initialises the completion system, loads shell plugins (_fzf-tab_, _zsh-autosuggestions_, _zsh-syntax-highlighting_), configures keybindings, sources aliases and tools configurations from the `.config/zsh/` dir.
- **[`.zalias`](home/.zalias)** — all my custom shell aliases, sourced by `.zshrc`.
- **[`.config/zsh/zoxide.zsh`](home/.config/zsh/zoxide.zsh)**, **[`.config/zsh/bat.zsh`](home/.config/zsh/bat.zsh)**, **[`.config/zsh/fzf.zsh`](home/.config/zsh/fzf.zsh)**, **[`.config/zsh/fnm.zsh`](home/.config/zsh/fnm.zsh)**, **[`.config/zsh/tirith.zsh`](home/.config/zsh/tirith.zsh)** - tool-specific setup configuration files, sourced by `.zshrc`.

#### shell prompt configs

I use [Starship](https://starship.rs) as custom cross-shell prompt.
The actual configurations for starship are defined wihin the **[`.config/starship.toml`](home/.config/starship.toml)** file,
while its integration setup with the zsh shell is done by the **[`.config/zsh/starship.zsh`](home/.config/zsh/starship.zsh)** file, sourced by `.zshrc`.

### git configs

Similarly to what I've done with Zsh configs, I also decided to split Git configs across multiple files,
then composed via `[include]` directives from the root `.gitconfig`:

- **[`.gitconfig`](home/.gitconfig)** — it's the root config file. Sets core behaviours: `main` as the default branch, pull-as-rebase, rerere, untracked cache, and line-ending normalisation.
- **[`.config/git/aliases.gitconfig`](home/.config/git/aliases.gitconfig)** — defines custom git _subcommands_, invoked as `git <alias>`.
- **[`.config/git/delta.gitconfig`](home/.config/git/delta.gitconfig)** — configures [git-delta](https://dandavison.github.io/delta/) as the default pager.
- **[`.config/delta/theme.gitconfig`](home/.config/delta/theme.gitconfig)** — contains the color theme used by delta.
- **[`.config/git/lfs.gitconfig`](home/.config/git/lfs.gitconfig)** — Git LFS filter configuration.
- **[`.config/git/ignore`](home/.config/git/ignore)** — global `.gitignore` file

#### Git identity management

In the past, I was using two separate identities for personal and work-related use. Nowadays, I use the same.
However, I like to use my pseudoonim on my personal projects, while using my full name on work-related repos.
I achieve this, by defining the following two git identities, which gets applied as the default git config.

- **[`.config/git/identity.personal.gitconfig`](home/.config/git/identity.personal.gitconfig)** — personal identity, applied as the default for all repos under `~/dev/personal/`.
- **[`.config/git/identity.work.gitconfig`](home/.config/git/identity.work.gitconfig)** — work identity, applied as the default for all repos under `~/dev/<work>/`.

Additionally, I've defined the following git aliases to make my life easier:

- `whoami` - displays the currently applied identity in the current dir.
- `set-personal`/`set-work` to easily override the default for a specific repo.
- `set-none` to remove any override and rely back to the default.

### Other

- **[`.config/nvim`](home/.config/nvim)** — [Neovim](https://neovim.io) configs. Tracked as a **git submodule** pointing to [`Amheklerior/nvim`](https://github.com/Amheklerior/nvim).
- **[`dev/personal/.markdownlintrc`](home/dev/personal/.markdownlintrc)** — markdownlint config for personal projects.

## The Bigger Picture

They are part of my [System Environment Setup](https://github.com/Amheklerior/sysenv) for quickly setting up new machines.

## License

Licensed under [MIT](LICENSE) © Andrea Amato 2026

_For information, see [TLDR Legal / MIT](https://www.tldrlegal.com/license/mit-license)_
