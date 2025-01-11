#!/bin/zsh

# apps config plist file paths
local ALT_TAB_PREFS="com.lwouis.alt-tab-macos"

# start at login without manu bar icon and no screen recording permissions
defaults write $ALT_TAB_PREFS startAtLogin -string true
defaults write $ALT_TAB_PREFS screenRecordingPermissionSkipped -string true
defaults write $ALT_TAB_PREFS menubarIconShown -string false
defaults write $ALT_TAB_PREFS "NSStatusItem Visible Item-0" -bool false
defaults delete $ALT_TAB_PREFS "NSStatusItem Preferred Position Item-0"

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
defaults write $ALT_TAB_PREFS windowOrder2 -int 2
defaults write $ALT_TAB_PREFS appearanceVisibility -int 0
defaults write $ALT_TAB_PREFS fadeOutAnimation -string true

# declutter selection view
defaults write $ALT_TAB_PREFS hideStatusIcons -string true
defaults write $ALT_TAB_PREFS hideSpaceNumberLabels -string true
defaults write $ALT_TAB_PREFS hideWindowlessApps -string true
defaults write $ALT_TAB_PREFS showTabsAsWindows -string false
defaults write $ALT_TAB_PREFS previewFocusedWindow -string false

# show useful info on selection view
defaults write $ALT_TAB_PREFS hideAppBadges -string false
defaults write $ALT_TAB_PREFS showAppsOrWindows -int 1
defaults write $ALT_TAB_PREFS showTitles -int 2
defaults write $ALT_TAB_PREFS titleTruncation -int 1

# enable vim-style navigation
# NOTE: hold down ⌘ to open alt-tab selection list,
# move up and down the list with J-K keys (no arrows),
# release to focus the seleced window.
defaults write $ALT_TAB_PREFS holdShortcut '"\U2318"'
defaults write $ALT_TAB_PREFS arrowKeysEnabled -string false
defaults write $ALT_TAB_PREFS vimKeysEnabled -string true
defaults write $ALT_TAB_PREFS shortcutStyle -int 0

# set other useful shortcuts
defaults write $ALT_TAB_PREFS quitAppShortcut -string 'Q'
defaults write $ALT_TAB_PREFS closeWindowShortcut -string 'W'
defaults write $ALT_TAB_PREFS toggleFullscreenWindowShortcut -string 'F'
defaults write $ALT_TAB_PREFS minDeminWindowShortcut -string 'M'
# NOTE: the 'H' shortcut goes in conflict with the vim-style navigation keys.
# if this is set to 'H', in fact, the app erases the vimKeysEnabled property.
defaults write $ALT_TAB_PREFS hideShowAppShortcut -string ''