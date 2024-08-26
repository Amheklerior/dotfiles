#!/usr/bin/env zsh

log="[Settings]: "

#------------------------------------------------------------------------------------#
#                                  • GENERAL •                                       #
#------------------------------------------------------------------------------------#

# Set computer name
echo "$log which name do you want to give to this computer? (amheklerior)" && read
sudo scutil --set ComputerName $REPLY
sudo scutil --set HostName $REPLY
sudo scutil --set LocalHostName $REPLY
defaults write com.apple.rapport familySyncedName -string $REPLY

# Allow text selection in images
defaults write -g AppleLiveTextEnabled -bool true


#------------------------------------------------------------------------------------#
#                   • LANG, LOCALE, FORMATS, UNITS, TIMEZONE •                       #
#------------------------------------------------------------------------------------#

# Set preferred languages
defaults write -g AppleLanguages -array "en-US" "it-IT"

# Set locale to IT keeping the EN language
# drive formats for date/time, number, currencies, etc
defaults write -g AppleLocale -string "en_US@rg=itzzzz"
defaults write -g AKLastLocale -string "en_US@rg=itzzzz"
defaults write com.apple.dock region -string "IT"
defaults write com.apple.iCal NotificationsLastLocale -string "en_US@rg=itzzzz"
defaults write com.apple.iCal BirthdayEventsGenerationLastLocale -string "en_US@rg=itzzzz"

# Switch to Fahrenheit as temperature unit (leave unset for Celsius)
# defaults write -g AppleTemperatureUnit -string "Fahrenheit"

# Leave unset to maintain Monday as first day of the week
# defaults delete -g AppleFirstWeekday

# Leave unset to maintain the metric system for units
# NOTE: possible values are:
# ----------------------------------------------------------------
# system            AppleMetricUnits        AppleMeasurementUnits
# ----------------------------------------------------------------
# Metric            leave unset             leave unset
# Imperial (US)     0                       "Inches"
# Imperial (UK)     1                       "Inches"
# ----------------------------------------------------------------
# defaults write -g AppleMetricUnits -int 0
# defaults write -g AppleMeasurementUnits -int "Inches"

# Set 12-hours time format
# defaults write -g AppleICUForce12HourTime -bool true

# Set system timezone
# NOTE: run `sudo systemsetup -listtimezones` for other values
# TOFIX: it works but with error:
# Error:-99 File:/AppleInternal/Library/BuildRoots/91a344b1-f985-11ee-b563-fe8bc7981bff/Library/Caches/com.apple.xbs/Sources/Admin/InternetServices.m Line:379
sudo systemsetup -settimezone "Europe/Rome" >/dev/null


#------------------------------------------------------------------------------------#
#                               • APPEARANCE / UI •                                  #
#------------------------------------------------------------------------------------#

# Switch to Dark theme
# NOTE: other options are:
# - `Light` -> leave both unset
# - `Auto`  -> only set `AppleInterfaceStyleSwithesAutomatically` to 1
defaults write -g AppleInterfaceStyle -string "Dark"
# defaults write -g AppleInterfaceStyleSwitchesAutomatically -int 1

# Set sidebar icon size to (1) small, (2) medium, (3) large
defaults write -g NSTableViewDefaultSizeMode -int 1

# Enable wallpaper tinting in windows
defaults write -g AppleReduceDesktopTinting -bool false

# Set accent and highlight colors
# NOTE: you can mix between accent and highlight colors...
# ------------------------------------------------------------------------------
# desired       accent        highlight                             aqua var
# ------------------------------------------------------------------------------
# multicolor    leave unset   leave unset                           leave unset
# blue          4             0.698039 0.843137 1.000000 Blue       1
# purple        5             0.968627 0.831373 1.000000 Purple     1
# pink          6             1.000000 0.749020 0.823529 Pink       1
# red           0             1.000000 0.749020 0.823529 Red        1
# orange        1             1.000000 0.874510 0.701961 Orange     1
# yellow        2             1.000000 0.937255 0.690196 Yellow     1
# green         3             0.752941 0.964706 0.678431 Green      1
# graphite      -1            0.847059 0.847059 0.862745 Graphite   6
# ------------------------------------------------------------------------------
# defaults write -g AppleAccentColor -int 3
# defaults write -g AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
# defaults write -g AppleAquaColorVariant -int 1


#------------------------------------------------------------------------------------#
#                                 • SCROLLING •                                      #
#------------------------------------------------------------------------------------#

# Show scrollbar: `WhenScrolling`, `Automatic`, `Always`
defaults write -g AppleShowScrollBars -string "WhenScrolling"

# Click the scroll bar to jump to:
# 0: the next page or
# 1: the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -int 1


#------------------------------------------------------------------------------------#
#                    • SYSTEM MENU BAR & CONTROL CENTER •                            #
#------------------------------------------------------------------------------------#

# Set the menu bar to autohide on fullscreen only
defaults write -g AppleMenuBarVisibleInFullscreen -bool false
defaults write -g _HIHideMenuBar -bool false

# Show time on the menu bar
# ...in digital style
defaults write com.apple.menuextra.clock IsAnalog -bool false
# ...with non-flashing time separator
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
# ...with no seconds
defaults write com.apple.menuextra.clock ShowSeconds -bool false
# ...including day of the week
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
# ...including full date: (0) if space is available, (1) always, (2) never
defaults write com.apple.menuextra.clock ShowDate -int 0

# Sets visible items on the system menu bar on the top
for item in "Battery" "BentoBox" "Clock" "WiFi"; do
  defaults write com.apple.controlcenter "NSStatusItem Visible $item" -bool true &>/dev/null
done

# Sets the control center items position
# NOTE: higher values gets places further to the left 
defaults write com.apple.controlcenter "NSStatusItem Preferred Position WiFi" -int 200
defaults write com.apple.controlcenter "NSStatusItem Preferred Position Battery" -int 150
defaults write com.apple.controlcenter "NSStatusItem Preferred Position BentoBox" -int 100
defaults write com.apple.controlcenter "NSStatusItem Preferred Position Clock" -int 50

# Remove Siri from the menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false

# Remove Spotlight from the menu bar
defaults write com.apple.Spotlight "NSStatusItem Visible Item-0" -bool false

# Remove TimeMachine from the menu bar
defaults write com.apple.systemuiserver menuExtras -array
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool false

# Make sure all other unwanted items are removed from the system menu bar
for item in \
  "AccessibilityShortcuts" \
  "AirDrop" \
  "Bluetooth" \
  "Display" \
  "FocusModes" \
  "Hearing" \
  "KeyboardBrightness" \
  "MusicRecognition" \
  "NowPlaying" \
  "ScreenMirroring" \
  "Sound" \
  "StageManager" \
  "UserSwitcher" \
; do
  defaults write com.apple.controlcenter "NSStatusItem Visible $item" -bool false &>/dev/null
  defaults delete com.apple.controlcenter "NSStatusItem Preferred Position $item" &>/dev/null
done


#------------------------------------------------------------------------------------#
#                                 • SPOTLIGHT •                                      #
#------------------------------------------------------------------------------------#

# IMPORTANT: Thinking to disable spotlight, in favour of either Alfred or Raycast
# disable spotlight keyboard shortcut
# /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:64:enabled 0" \
# "$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"

# disable spotlight indexing for all volumes
sudo mdutil -a -i off

# Change indexing order and disable some search results
# NOTE: remove all items once I switch to its alternative
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 1;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "SOURCE";}'

# Load new settings before rebuilding the index, ...
killall mds > /dev/null 2>&1
# ...make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null
# ...erase and rebuild the index from scratch
sudo mdutil -E / > /dev/null


#------------------------------------------------------------------------------------#
#                                   • SIRI •                                         #
#------------------------------------------------------------------------------------#

# disable Siri
defaults write com.apple.assistant.support Assistant\ Enabled -bool false
defaults write com.apple.Siri StatusMenuVisible -bobl false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bobl false
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bobl false


#------------------------------------------------------------------------------------#
#                                   • DOCK •                                         #
#------------------------------------------------------------------------------------#

# Dock position on screen: `bottom`, `left`, `right`
defaults write com.apple.dock orientation -string "bottom"

# Don't automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false

# Autohide animation properties: in seconds (requires autohide)
defaults write com.apple.dock autohide-delay -float 0.2
defaults write com.apple.dock autohide-time-modifier -float 0.1

# Set dock icons size in pixels
defaults write com.apple.dock tilesize -int 36

# Set dock icons to grow on hover
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 48

# Animate opening apps
defaults write com.apple.dock launchanim -bool true

# Show indicator lights for running apps
defaults write com.apple.dock show-process-indicators -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Change minimize/maximize window animation effect: `genie`, `scale`, `suck`
defaults write com.apple.dock mineffect -string "scale"

# Show suggested and recent apps on the dock
defaults write com.apple.dock show-recents -bool false

# Wipe all (default) apps from the Dock, then add the favourite apps
defaults write com.apple.dock persistent-apps -array
# TODO: Add favs apps
# defaults write com.apple.dock persistent-apps -array-add '
# {
#   "tile-data" = {
#     "file-data" = {
#       "_CFURLString" = "/Applications/iTerm.app";
#       "_CFURLStringType"=0;
#     };
#   };
# }


#------------------------------------------------------------------------------------#
#                                   • WINDOWS •                                      #
#------------------------------------------------------------------------------------#

# Double-click a window's title bar to: 'Maximize', 'Minimize', 'None' (do nothing)
defaults write -g AppleActionOnDoubleClick -string "None"

# Hide desktop icons when windows are open
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool true

# Prefer tabs when opening documents: 'always', 'manual', or when in 'fullscreen'
defaults write -g AppleWindowTabbingMode -string "fullscreen"

# Close all windows when quitting an app (no restore when reopening)
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false


#------------------------------------------------------------------------------------#
#                           • SPACES, MISSION CONTROL •                              #
#------------------------------------------------------------------------------------#

# When switching to an app, go to space with open windows of that app
defaults write -g AppleSpacesSwitchOnActivate -bool true

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-apps -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Displays have separate spaces
defaults write com.apple.spaces spans-displays -bool false


#------------------------------------------------------------------------------------#
#                             • DESKTOP & WIDGETS •                                  #
#------------------------------------------------------------------------------------#

# Reveal desktop when clicking the wallpaper
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true 

# Widgets appearance: (0) monochrome, (1) in full color, or (2) automatic
defaults write com.apple.widgets widgetAppearance -int 2

# Use iPhone widgets
defaults write com.apple.chronod remoteWidgetsEnabled -bool true


#------------------------------------------------------------------------------------#
#                               • HOT CORNERS •                                      #
#------------------------------------------------------------------------------------#

# NOTE: Possible values are:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

# Top left screen corner -> no-op
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner -> no-op
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner -> no-op
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner -> no-op
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0
