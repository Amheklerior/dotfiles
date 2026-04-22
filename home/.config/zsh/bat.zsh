# ------------------------------------------------------------------------------
# BAT SETUP
# ------------------------------------------------------------------------------
# configure bat as a `cat` replacement, for syntax-highlighted previews,
# man pages, and help output.
#
# see: https://github.com/sharkdp/bat
# ------------------------------------------------------------------------------

# setup bat color theme
export BAT_THEME=gruvbox-dark

# setup bat as man pager
export MANPAGER="sh -c 'col -bx | bat --language=man --style=plain'"
# ...only if you experience formatting issues with man pages
# export MANROFFOPT="-c"

# integrate bat to the `-h` and `--help` command options
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# replace `cat`
alias cat="bat"