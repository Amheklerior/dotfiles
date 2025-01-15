#!/bin/bash

# apps config plist file paths
local HIDDEN_BAR_PREFS="com.dwarvesv.minimalbar"

# autorun at login, without showing preferences
defaults write $HIDDEN_BAR_PREFS isAutoStart -bool true
defaults write $HIDDEN_BAR_PREFS isShowPreferences -bool false

# auto-hide menu items after 10 seconds
defaults write $HIDDEN_BAR_PREFS isAutoHide -bool true
defaults write $HIDDEN_BAR_PREFS numberOfSecondForAutoHide -float 10
