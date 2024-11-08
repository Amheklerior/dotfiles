#!/usr/bin/env zsh

log="[Settings]: "

go_on () {
  echo "...continue? (y/n)" && read
  if [[ $REPLY != "y" || $REPLY != "Y" ]]; then
    echo "Cool! bye" && exit 0
  fi
}

#------------------------------------------------------------------------------------#
#                                  • GENERAL •                                       #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Ccomputer name, auto updates, and general settings"
go_on()

updates="/Library/Preferences/com.apple.SoftwareUpdates.plist"

# Set computer name
echo "$log which name do you want to give to this computer? (amheklerior)" && read
sudo scutil --set ComputerName $REPLY
sudo scutil --set HostName $REPLY
sudo scutil --set LocalHostName $REPLY
defaults write com.apple.rapport familySyncedName -string $REPLY

# Allow text selection in images
defaults write -g AppleLiveTextEnabled -bool true

# Automatically check for software updates and download them
sudo defaults write $updates AutomaticCheckEnabled -bool true
sudo defaults write $updates AutomaticDownload -bool true

# Automatically download and install critical updates 
sudo defaults write $updates ConfigDataInstall -bool true
sudo defaults write $updates CriticalUpdateInstall -bool true


#------------------------------------------------------------------------------------#
#                   • LANG, LOCALE, FORMATS, UNITS, TIMEZONE •                       #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Language, locale, and timezone"
go_on()

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

# Enable date and time syncrhorization
sudo systemsetup -setusingnetworktime on

# Set timezone atuomatically based on current location
sudo defaults /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

# Set system timezone manually (remember to disable the automatic timezone option above)
# NOTE: run `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Europe/Rome" >/dev/null

# Apply timezone changes
sudo launchctl kickstart -k system/com.apple.locationd


#------------------------------------------------------------------------------------#
#                               • APPEARANCE / UI •                                  #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Appearance/UI"
go_on()

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

echo "[Prefs]: Scrolling behaviour settings"
go_on()

# Show scrollbar: `WhenScrolling`, `Automatic`, `Always`
defaults write -g AppleShowScrollBars -string "WhenScrolling"

# Click the scroll bar to jump to:
# 0: the next page or
# 1: the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -int 1

# Prefer natural direction (content follows fingers direction)
defaults write -g com.apple.swipescrolldirection -int 1


#------------------------------------------------------------------------------------#
#                    • SYSTEM MENU BAR & CONTROL CENTER •                            #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Sys menu bar and settings"
go_on()

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

echo "[Prefs]: Spotlight settings"
go_on()

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

echo "[Prefs]: disable Siri"
go_on()

# disable Siri
defaults write com.apple.assistant.support Assistant\ Enabled -bool false
defaults write com.apple.Siri StatusMenuVisible -bobl false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bobl false
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bobl false


#------------------------------------------------------------------------------------#
#                                   • DOCK •                                         #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Dock settings"
go_on()

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

echo "[Prefs]: Windows settings"
go_on()

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

echo "[Prefs]: Spaces and mission control settings"
go_on()

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

echo "[Prefs]: Desktop and widgets settings"
go_on()

# Reveal desktop when clicking the wallpaper
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true 

# Widgets appearance: (0) monochrome, (1) in full color, or (2) automatic
defaults write com.apple.widgets widgetAppearance -int 2

# Use iPhone widgets
defaults write com.apple.chronod remoteWidgetsEnabled -bool true


#------------------------------------------------------------------------------------#
#                               • HOT CORNERS •                                      #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Remove all hot corners shortcuts"
go_on()

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


#------------------------------------------------------------------------------------#
#                              • POWER MANAGEMENT •                                  #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Power management settings"
go_on()

# Enable put to sleep with power button
sudo systemsetup -setallowpowerbuttontosleepcomputer on

# Set sleep times when on AC Power
sudo pmset -c displaysleep 10
sudo pmset -c disksleep 0
sudo pmset -c sleep 0

# Set sleep times when on battery
sudo pmset -b displaysleep 5
sudo pmset -b disksleep 10
sudo pmset -b sleep 10

# Maximize performance on AC Power, but reduce energy usage on battery
sudo pmset -c lowpowermode 0
sudo pmset -b lowpowermode 1

# Slightly dim display on battery
sudo pmset -b lessbright

# Enable lid wakeup (lifting the screen lid up wakes the system)
sudo pmset -a lidwake 1

# Enable wakeup when devices with same Cloud ID are near
sudo pmset -a proximitywake 1

# Enable wakup when switching power source
sudo pmset -a acwake 1

# Enable wakup on network access, unless on battery
sudo pmset -a womp 1
sudo pmset -b womp 0

# Restart automatically on power loss, or freeze
sudo pmset -a autorestart 1
sudo systemsetup -setrestartfreeze on

# Hibernate mode:
#  0: Disable hibernation (speeds up sleep/wake operations)
#  3: Copy RAM to disk (can restore state in case of power failure)
# 25: Copy RAM to disk and power it off (better battery life)
#
# NOTE: Here's a table with the implications of each option
# --------------------------------------------------------------------------------
# setting     RAM copy to disk    RAM power during sleep            restore state
# --------------------------------------------------------------------------------
# 0           off                 on                                off
# 3           on                  on (unless a power loss occur)    on
# 25          on                  off                               on
# --------------------------------------------------------------------------------
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space, replacing it
# with a readonluy zero-byte file instead
sudo rm /private/var/vm/sleepimage
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage


#------------------------------------------------------------------------------------#
#                              • LOGIN WINDOW •                                      #
#------------------------------------------------------------------------------------#

echo "[Prefs]: login window settings"
go_on()

# path to the plist file
loginwindow=/Library/Preferences/com.apple.loginwindow.plist

# Hide user name and avatar
sudo defaults $loginwindow HideUserAvatarAndName -bool true

# Don't show a custom message
sudo defaults $loginwindow LoginwindowText -strin ""

# Don't show password hint
sudo defaults $loginwindow RetriesUntilHint -int 0

# Show the Sleep, Restart and Shutdown buttons
sudo defaults $loginwindow PowerOffDisabled -bool false


#------------------------------------------------------------------------------------#
#                               • SCREEN SAVER •                                     #
#------------------------------------------------------------------------------------#

echo "[Prefs]: screen saver settings"
go_on()

# Start Screen saver when inactive for 5 minutes
# NOTE: set to 0 to never have screensaver
defaults write com.apple.screensaver idleTime -int 300

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


#------------------------------------------------------------------------------------#
#                             • AUDIO / SOUNDS •                                     #
#------------------------------------------------------------------------------------#

echo "[Prefs]: audio settings"
go_on()

# Disable the sound effects on system boot (%00 to reenable it)
sudo nvram StartupMute="%01"

# Play UI sound effects
defaults write -g com.apple.sound.uiaudio.enabled -bool true

# Don't play feedback sound on volume change
defaults write -g com.apple.sound.beep.feedback -bool false

# Alerts volume (it's not the general output volume)
defaults write -g com.apple.sound.beep.volume -float 0.7


#------------------------------------------------------------------------------------#
#                           • FOCUS / NOTIFICATIONS •                                #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Notification settings, and sync focus across devices"
go_on()

# Share focus across devices (activating it on one device, activates it for all)
defaults write com.apple.donotdisturb disableCloudSync -bool false

# Show notification previews: (1) never, (2) when unlocked, (3) always
defaults write com.apple.ncprefs content_visibility -int 2


#------------------------------------------------------------------------------------#
#                                 • KEYBOARD •                                       #
#------------------------------------------------------------------------------------#

echo "[Prefs]: keyboard settings"
go_on()

# Enable full keyboard access for all controls (move focus with Tab and Shift+Tab)
defaults write -g AppleKeyboardUIMode -int 2

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# Function keys default behaviour: 
# `true`:   F1, F2, etc. behave as standard function keys
# `false`:  pressing a function key will perform the special feature printed on that key
defaults write -g com.apple.keyboard.fnState -bool false

# Fn/🌐︎ key press behaviour:
# 0: do nothing
# 1: change input source (swhith between keyboard layouts)
# 2: show emojis, symbols, and more
# 3: start dictation
defaults write com.apple.HIToolbox AppleFnUsageType -int 2

# Use large window for emoji and symbols 
defaults write com.apple.CharacterPaletteIM CVStartAsLargeWindow --bool true


#------------------------------------------------------------------------------------#
#                                   • TEXT •                                         #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Clear replacement dictionary"
go_on()

# Clear replacement dictionary
defaults write -g NSUserDictionaryReplacementItems -array


#------------------------------------------------------------------------------------#
#                                 • PRINTERS •                                       #
#------------------------------------------------------------------------------------#

echo "[Prefs]: A4 as default printing format"
go_on()

# Set 'A4' as the default printing format
defaults write com.apple.PrintingPrefs DefaultPaperID -string "iso-a4"


#------------------------------------------------------------------------------------#
#                             • MOUSE / TRACKPAD •                                   #
#------------------------------------------------------------------------------------#

echo "[Prefs]: mouse/trackpad settings"
go_on()

# Set a high tracking speed
defaults write -g com.apple.trackpad.scaling -float 2.5

# Disable tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Click threshold: (0) Light, (1) Medium, (2) Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1

# Prefer sublte clicking sound
defaults write com.apple.AppleMultitouchTrackpad ActuationStrenght -int 0

# Disable force-click and haptic feedback
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true

# Disable builtin trackpad when an external mouse/trackpad is connected
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad USBMouseStopsTrackpad -int 1


#------------------------------------------------------------------------------------#
#                                 • GESTURES •                                       #
#------------------------------------------------------------------------------------#

echo "[Prefs]: Set gestures"
go_on()

# Secondary click with: two-fingers click
defaults write -g ContextMenuGesture -int 1
defaults com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Pinch to zoom
defaults com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

# Double-tap with two fingers to zoom 
defaults com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true

# Rotate with two fingers
defaults com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true

# Swipe between pages with two-fingers horizonal scoll
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool true

# Swipe between spaces with three-fingers horizontal scroll
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Open notification center with two-finger left-scroll from the right edge
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
 
# Disable gestures: Mission Control, App Expose
defaults write com.apple.dock showMissionControlGestureEnabled -bool false
defaults write com.apple.dock showAppExposeGestureEnabled -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 0

# Disable festures: App Launchpad, Desktop Reveal
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false
defaults write com.apple.dock showDesktopGestureEnabled -bool false 
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 0