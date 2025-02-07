#!/bin/zsh

# Block all cookies
defaults write com.apple.Safari BlockStoragePolicy -int 0
defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 2
defaults write com.apple.Safari WebKitPreferences.storageBlockingPolicy -int 2

# Block search engine suggestions
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Use compat tab bar layout, without coloring
defaults write com.apple.Safari ShowStandaloneTabBar -bool true
defaults write com.apple.Safari NeverUseBackgroundColorInToolbar -bool true

# Remove suggestions and recently closed from the start page
defaults write com.apple.Safari HideSuggestionsEmptyItemView -bool true
defaults write com.apple.Safari HideStartPageRecentlyClosedTabsEmptyItemView -bool true

# Automatically save read-later articles for offline reading
defaults write com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool true

# Don't automatically open safe files after downloads 
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow using Apple Pay with touch ID to pay for purchases on websites
defaults write com.apple.Safari WebKitPreferences.applePayCapabilityDisclosureAllowed -bool true

# ⌘ + click opens links in new tabs, but without immediately switching to them
defaults write com.apple.Safari CommandClickMakesTabs -bool true
defaults write com.apple.Safari OpenNewTabsInFront -bool false