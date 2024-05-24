#!/bin/bash

# strip out unnecessary warnings from the make output
# NOTE: warnings are fired because of overlapping include clauses for the same module
ignore-warnings() {
  egrep -v "(warning: overriding commands|warning: ignoring old commands)"
}

# run the preliminary steps (requires user interacting with the UI)
# TODO: remove once the prepare rules are fully automated
make prepare --silent 2>&1 | ignore-warnings

# run the installation script 
# --silent: don't echo rules recipes
make bootstrap --silent 2>&1 | ignore-warnings