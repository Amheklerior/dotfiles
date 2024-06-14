# TODOs

### Must have:

- [x] Init the repository
- [x] Create a basic `makefile` for automating installation on a new system
- [x] Implement the makefile's steps
- [x] Add the `Brewfile` for installing tools and apps
- [x] Add ssh keys in a safe way
- [x] Add recovery codes in a safe way
- [x] Find a way to obfuscate my personal email in the repo
- [x] Add dotfiles
- [x] Add the binaries to the Brewfile
- [x] Add the cask-apps to the Brewfile
- [x] Add the mas-apps to the Brewfile
- [x] Add the vscode extentions to the Brewfile
- [x] Add `node` configs
- [x] Move `/.dotfiles/backup` to `/backup`
- [x] Add iTerm profile preferences
- [x] Move the `/bin` dir to the `$home` and link it with stow
- [x] Add `bun` configs
- [x] Add `vscode` settings
- [x] Automate repo cloning into the bootstrap process
- [ ] Add `neovim` configs
- [ ] Add `tmux` (or `zellij`) configs

### Should have:

- [x] Split the `.zshrc` into `.zshrc` and `.zprofile` and `.zshenv`
- [x] Write about packages/apps installation on the [`README.md`](/README.md)
- [x] Write about the dotfiles structure and symlinking on the [`README.md`](/README.md)
- [x] Write about ssh keys and backup codes management on the [`README.md`](/README.md)
- [x] Write about the keyboard layout setup on the [`README.md`](/README.md)
- [x] Move some sections out from the [`README.md`](/README.md) to make it more concice
- [x] Add credits to the [`README.md`](/README.md)
- [x] Add keyboard layout
- [ ] Automate [macosx preferences](https://github.com/mathiasbynens/dotfiles/blob/main/.macos) setup

### Nice to have:

- [x] Break down the makefile into multiple files
- [x] Break down the pakcages step in the makefile, to better manage task dependencies
- [ ] Automate macos command line dev tools installation (ie. no dialog prompt) or make it manual and avoid the [`prepare.mk`](/install/rules/packages.mk) altogether
- [ ] Automate `iterm2` preferences setup into the makefile
- [ ] Compartimentalize shell configurations per tool
- [ ] Compartimentalize the dotfiles (separate `stow` trees instead of a global one)
- [ ] Convert todos into [Github Issues](https://github.com/Amheklerior/dotfiles/issues)
- [ ] Write automated tests against the installation process
- [ ] Setup Github Actions
- [ ] Adapt the installation process for **Windows** systems
- [ ] Adapt the installation process for **Linux** systems

### To explore:

- [x] [Ansible Playbooks](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html) as an alternative to the makefile
- [ ] [smart `pnpm` shell completion](https://github.com/g-plane/pnpm-shell-completion)
- [ ] [smart `yarn` shell completion](https://github.com/g-plane/zsh-yarn-autocompletions)
- [ ] [`zellij`](https://zellij.dev/) as an alternative to `tmux`
- [ ] [`yabai`](https://github.com/koekeishiya/yabai) for a better windows and spaces management on macOS
- [ ] [`bug.n`](https://github.com/fuhsjr00/bug.n) for a better windows management on Windows
- [ ] [`git-worktree`](https://git-scm.com/docs/git-worktree) workflow
- [ ] [`mackup`](https://github.com/lra/mackup) to manage application settings
- [ ] [ember](https://amber-lang.com/) to write bash-compiled scripts

### Ideas:

- [ ] add shell nesting level indicator to the shell prompt
- [ ] cli for managing my dotfiles and workflow
- [ ] cli for managing my work and personal repos in bulk
- [ ] cli for getting my cheatsheets on commands/languages/topics
