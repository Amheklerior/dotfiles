#!/usr/bin/env zsh

log="[Settings]: "

#------------------------------------------------------------------------------------#
#                                 • GENERAL •                                        #
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
#                 • LANG, LOCALE, FORMATS, UNITS, TIMEZONE •                         #
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
