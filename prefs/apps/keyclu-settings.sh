#!/bin/zsh

# apps config plist file paths
local KEYCLU_PREFS="com.0804Team.KeyClu"

# don't send profile info
defaults write $KEYCLU_PREFS SUSendProfileInfo -bool false

# disable automatic updates
defaults write $KEYCLU_PREFS SUAutomaticallyUpdate -bool false
defaults write $KEYCLU_PREFS SUEnableAutomaticChecks -bool false

# start at login without manu bar icon
defaults write $KEYCLU_PREFS launchAtLogin -bool true
defaults write $KEYCLU_PREFS hideMenuIcon -bool true

# don't show app icon in overlay when launching/quitting the app
defaults write $KEYCLU_PREFS silentLaunchQuit -bool true

# show the shortcuts window by pressing the ⌘ key twice and hold for .5 seconds
# then deactivate by pressing any non-modifier key
defaults write $KEYCLU_PREFS activationKeyId -int 0
defaults write $KEYCLU_PREFS activationKeyType -int 1
defaults write $KEYCLU_PREFS activationPersistentKeyType -int 0
defaults write $KEYCLU_PREFS keyHoldingDelay -float 0.5
defaults write $KEYCLU_PREFS dismissKeyType -int 1

# display shortcuts in a dark window (aligned with system appearance),
# arranged in 4 columns, with the action to the left and the shortcut to the right
defaults write $KEYCLU_PREFS appearance -string system
defaults write $KEYCLU_PREFS amountOfColumns -int 4
defaults write $KEYCLU_PREFS fontSize -float 12
defaults write $KEYCLU_PREFS showHotkeyOnTheRight -bool true

# highlighting in yellow the showrtcuts that match the currently pressed keys
defaults write $KEYCLU_PREFS showHighlight -bool true
defaults write $KEYCLU_PREFS highlightAccentColor -int 2

# show inactive menu items grayed out
defaults write $KEYCLU_PREFS showInactiveMenu -bool true

# don't show the app icon, bookmarks, nor user-hidden menu items
defaults write $KEYCLU_PREFS showAppIcon -bool false
defaults write $KEYCLU_PREFS showBookmarks -bool false
defaults write $KEYCLU_PREFS showUserHiddenElements -bool false

# show MacOS keyboard shortcuts, custom shortcuts, and user defined shortcuts
defaults write $KEYCLU_PREFS enableMacosShortcuts -bool true
defaults write $KEYCLU_PREFS enableCustomShortcuts -bool true
defaults write $KEYCLU_PREFS enableMyShortcuts -bool true

# integrate with skhd shortcuts
# defaults write $KEYCLU_PREFS enableSKHD -bool true
