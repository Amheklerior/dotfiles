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
#                      • LANG, LOCALE, FORMATS, UNITS •                              #
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
