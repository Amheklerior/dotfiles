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