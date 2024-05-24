#!/bin/bash

# don't echo the commands while running make
export MAKEFLAGS="--silent"

# run the preliminary steps and the bootstrap pipeline
make prepare && make