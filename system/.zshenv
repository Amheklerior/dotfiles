# XDG Base Directory Spec:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"

# my personal and work dirs
export PERSONAL="$HOME/personal"
export WORK="$HOME/work"

# path to the dotfiles repo
export DOTFILES="$HOME/.dotfiles"

# path to the bin folder
export BIN="$HOME/bin"

# path to the shell plugins
export SHELL_PLUGINS="$XDG_CONFIG_HOME/plugins"

# disable telemetry and data collection for apps and services
# IMPORTANT: it's not universally honored/supported across all software
# NOTE: `not consent` if set to `1`, `consent` if set with any other value or not set at all
export DO_NOT_TRACK=1

# ensure unique values for the path and fpath arrays
typeset -U path fpath

# add custom binaries to the path
path=(
  $BIN
  $path
)
