# ------------------------------------------------------------------------------
# FNM SETUP
# ------------------------------------------------------------------------------
# setup fnm for fast Node.js version management and automatic version switching.
#
# see: https://github.com/Schniz/fnm
# ------------------------------------------------------------------------------

# define the root directory for node installations
export FNM_DIR="$HOME/.fnm"

# resolve `engines.node` field in `package.json` whenever a
# `.node-version`/`.nvmrc` file is not present
export FNM_RESOLVE_ENGINES="true"

# setup fnm env vars (the `--use-on-cd` option ensures `fnm use` is automatically
# run when cd-ing into a directory containing a `.node-version` or `.nvmrc` file
eval "$(fnm env --use-on-cd)"