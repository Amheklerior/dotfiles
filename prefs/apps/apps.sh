#!/bin/zsh

local LOG_PREFIX="[load apps preferences]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# apps config plist file paths
local ALT_TAB_PREFS="$HOME/Library/Preferences/com.lwouis.alt-tab-macos"

#------------------------------------------------------------------------------------#
# Alt Tab                                                                            #
#------------------------------------------------------------------------------------#

_log "$LOG_PREFIX loading preferences for Alt-Tab..."

# start at login without manu bar icon and no screen recording permissions
defaults write $ALT_TAB_PREFS startAtLogin -bool true
defaults write $ALT_TAB_PREFS menubarIconShown -bool false
defaults write $ALT_TAB_PREFS screenRecordingPermissionSkipped -bool true

# disable automatic updates and crash reporting
defaults write $ALT_TAB_PREFS updatePolicy -int 0
defaults write $ALT_TAB_PREFS crashPolicy -int 0
defaults write $ALT_TAB_PREFS SUAutomaticallyUpdate -int 0
defaults write $ALT_TAB_PREFS SUEnableAutomaticChecks -int 0

# show as a fast, small, vertical list, ordered alphabetically
defaults write $ALT_TAB_PREFS windowDisplayDelay -int 100
defaults write $ALT_TAB_PREFS appearanceSize -int 0
defaults write $ALT_TAB_PREFS appearanceStyle -int 2
defaults write $ALT_TAB_PREFS windowOrder -int 2
defaults write $ALT_TAB_PREFS appearanceVisibility -int 0
defaults write $ALT_TAB_PREFS fadeOutAnimation -bool true

# declutter selection view
defaults write $ALT_TAB_PREFS hideStatusIcons -bool true
defaults write $ALT_TAB_PREFS hideSpaceNumberLabels -bool true
defaults write $ALT_TAB_PREFS hideWindowlessApps -bool true

# show useful info on selection view
defaults write $ALT_TAB_PREFS hideAppBadges -bool false
defaults write $ALT_TAB_PREFS previewFocusedWindow -bool true
defaults write $ALT_TAB_PREFS showAppsOrWindows -int 1
defaults write $ALT_TAB_PREFS showTitles -int 2
defaults write $ALT_TAB_PREFS titleTruncation -int 1

# enable vim-style navigation
# NOTE: hold down ⌘ to open alt-tab selection list,
# move up and down the list with J-K keys (no arrows),
# release to focus the seleced window.
defaults write $ALT_TAB_PREFS holdShortcut '"\U2318"'
defaults write $ALT_TAB_PREFS arrowKeysEnabled -bool false
defaults write $ALT_TAB_PREFS vimKeysEnabled -bool true
defaults write $ALT_TAB_PREFS shortcutStyle -int 0

# set other useful shortcuts
defaults write $ALT_TAB_PREFS quitAppShortcut -string 'Q'
defaults write $ALT_TAB_PREFS closeWindowShortcut -string 'W'
defaults write $ALT_TAB_PREFS hideShowAppShortcut -string 'H'
defaults write $ALT_TAB_PREFS toggleFullscreenWindowShortcut -string 'F'
defaults write $ALT_TAB_PREFS minDeminWindowShortcut -string 'M'
