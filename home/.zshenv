# ------------------------------------------------------------------------------
# SHELL & SYSTEM-WIDE LANGUAGE/LOCALE SETTINGS
# ------------------------------------------------------------------------------
# These settings affect the language, locale, and formatting preferences for the
# shell and any applications that rely on these environment variables.
#
# These env vars respects the following precedence order:
# 1. LC_ALL   - overrides all other LC_* vars
# 2. LC_*     - set specific formats for various language and locale aspects
# 3. LANGUAGE - only for translations, takes precedence over the LANG var
# 4. LANG     - general default if no specific locale or language variables are set
# ------------------------------------------------------------------------------

# use US English as default language
export LANGUAGE=en_US
export LANG=en_US.UTF-8

# use metric system over imperial
export LC_MEASUREMENT=it_IT.UTF-8

# use day-month-year, 24-hour date and time formats
export LC_TIME=it_IT.UTF-8

# make sure there's no override
export LC_ALL=

# ------------------------------------------------------------------------------
# XDG BASE DIR SPEC
# ------------------------------------------------------------------------------
# set up XDG base directories for better organization of config, cache, data,
# and state files, following the XDG Base Directory Specification.
#
# see: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# ------------------------------------------------------------------------------

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"

# ------------------------------------------------------------------------------
# GLOBAL DIR PATHS
# ------------------------------------------------------------------------------
# common paths used across shell configs and personal projects.
# ------------------------------------------------------------------------------

export SHELL_PLUGINS="$XDG_CONFIG_HOME/plugins"
export PERSONAL="$HOME/dev/personal"
export WORK="$HOME/dev/heritage-holdings"
export SYSENV_REPO="$PERSONAL/sysenv"
export DOTFILES_REPO="$SYSENV_REPO/dotfiles"

# ------------------------------------------------------------------------------
# PRIVACY & TELEMETRY
# ------------------------------------------------------------------------------
# defaults to privacy-first behavior for tools that honor telemetry controls.
# ------------------------------------------------------------------------------

# disable telemetry and data collection for apps and services
#   - `not consent` if set to `1`
#   - `consent` if set with any other value or not set at all
# WARN: it's not universally honored/supported across all software
export DO_NOT_TRACK=1
