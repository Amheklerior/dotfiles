#!/bin/zsh

# Enable short names for contacts with format "John D." rather than just "John"
defaults write -g NSPersonNameDefaultShortNameEnabled -int 0
defaults write -g NSPersonNameDefaultShortNameFormat -int 1