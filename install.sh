#!/bin/bash

# don't echo the commands while running make
export MAKEFLAGS="--silent"

# run the bootstrap pipeline
make bootstrap