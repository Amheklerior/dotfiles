# TODO: 
# - Finder sidebar items




#---- GENERAL ----------------------------------------------------------------# 

# Set computer name
sudo scutil --set ComputerName "amheklerior"
sudo scutil --set HostName "amheklerior"
sudo scutil --set LocalHostName "amheklerior.local"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Set dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Set highlight color to green
# defaults write NSGlobalDomain AppleHighlightColor -string "<RGB Format>"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Notification Center
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Adjust toolbar title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding



#---- LANG, LOCALE, FORMATS --------------------------------------------------#

# Set preferred languages
defaults write NSGlobalDomain AppleLanguages -array "en-US" "en-GB" "it"

# Use the metric system
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"

# Set locale (date and time format, number format, currency unit)
defaults write NSGlobalDomain AppleLocale -string "it_IT"

# Set timezone (run `sudo systemsetup -listtimezones` for other values)
sudo systemsetup -settimezone "Europe/Rome" > /dev/null



#---- TRACKPAD ---------------------------------------------------------------#

# Disable tap-to-click (force-click only)
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Enable secondary click
defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Click threshold: (0) Light, (1) Medium, (2) Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad FirstClickThreshold -bool false

# No bottom corner right-click mapping
defaults write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0



#---- SCROLLING BEHAVIOUR ----------------------------------------------------#

# Show scrollbar: `WhenScrolling`, `Automatic`, `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Click the scroll bar to jump to (0) the next page or (1) the spot that's clicked 
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Use scroll gesture with the Ctrl (^) modifier key to zoom, following keyboard focus
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable smooth scrolling
# (Uncomment if you’re on an older Mac that messes up the animation)
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false



#---- KEYBOARD ---------------------------------------------------------------#

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Fn/🌐︎ key press behaviour:
# 0: do nothing
# 1: change input source (swhith between keyboard layouts)
# 2: show emojis, symbols, and more
# 3: start dictation
defaults write com.apple.HIToolbox AppleFnUsageType -int 2

# Function keys default behaviour: 
# `true`:   F1, F2, etc. behave as standard function keys
# `false`:  pressing a function key will perform the special feature printed on that key
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false



#---- TYPING -----------------------------------------------------------------#

# Disable autocorrection
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic dash, period, and quote substitution 
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false



#---- SCREEN -----------------------------------------------------------------#

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0



#---- DESKTOP ----------------------------------------------------------------#

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`.
rm -rf ~/Library/Application Support/Dock/desktoppicture.db
sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
sudo ln -s $HOME/.dotfiles/wallpapers/sunrise-deer.jpeg /System/Library/CoreServices/DefaultDesktop.jpg

# Hide all icons
# defaults write com.apple.finder CreateDesktop -bool false

# Group directories on top, regardless of sort type
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool "true"

# Don't show hard drives, removable media, and connected servers on Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Show item info near icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set size and grid spacing for icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist



#---- FINDER WINDOWS ---------------------------------------------------------#

# Set Desktop as the default location for new Finder windows
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Don't allow quitting Finder via ⌘ + Q
defaults write com.apple.finder QuitMenuItem -bool false

# Set sidebar icon size to (1) small, (2) medium, (3) large
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable animations for opening windows and getting file/dir info
defaults write com.apple.finder DisableAllAnimations -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Open dirs in new windows
defaults write com.apple.finder FinderSpawnTab -bool false

# Remove all tags
defaults write com.apple.finder FavoriteTagNames -array
defaults write com.apple.finder FavoriteTags -array

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true



#---- FINDER CONTENT ---------------------------------------------------------#

# View style in all Finder windows by default:
# `icnv` -> Icon view
# `clmv` -> Column view
# `glyv` -> Gallery view
# `Nlsv` -> List view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show hidden files by default (Toggle with ⌘ + SHIFT + .)
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show /Volumes and /Library dirs
# sudo chflags nohidden /Volumes
# chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Group directories on top, regardless of sort type
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# When performing a search, search the current directory by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories, with no delay
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show item info near icons
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

# Set grid spacing for icons
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist

# Remove Dropbox’s green checkmark icons in Finder
# file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
# [ -e "${file}" ] && mv -f "${file}" "${file}.bak"



#---- SPACES -----------------------------------------------------------------#

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Avoid jumping to space when opening application
defaults write com.apple.dock workspaces-auto-swoosh -bool false

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool false



#---- DOCK -------------------------------------------------------------------#

# Dock position on screen: `bottom`, `left`, `right`
defaults write com.apple.dock orientation -string "bottom"

# Tile size in pixels
defaults write com.apple.dock tilesize -int 36

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false

# Enable magnification on hover
defaults write com.apple.dock magnification -bool true

# Autohide animation properties: in seconds
# requires autohide set to `true`
defaults write com.apple.dock autohide-delay -float 0.2
defaults write com.apple.dock autohide-time-modifier -float 0.1

# Change minimize/maximize window animation effect: `genie`, `scale`, `suck`
# requires autohide set to `true`
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Show suggested and recent apps
defaults write com.apple.dock show-recents -bool false

# Show only open apps in the Dock
defaults write com.apple.dock static-only -bool false

# Show indicator lights for open apps
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening apps
defaults write com.apple.dock launchanim -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Enable highlight hover effect for stack items
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Wipe all (default) apps from the Dock, then add the favourite apps
defaults write com.apple.dock persistent-apps -array

# TODO: Decide what to have on the Dock for a minimal, distraction-free setup... 
# defaults write com.apple.dock persistent-apps -array-add '
# {
#   "tile-data" = {
#     "file-data" = {
#       "_CFURLString" = "/Applications/iTerm.app";
#       "_CFURLStringType"=0;
#     };
#   };
# } 
# '

# Cleanup current Dock state
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete



#---- SCREENSHOTS ------------------------------------------------------------#

# Screenshots format: `png`, `bmp`, `gif`, `jpg`, `pdf`, `tiff`, `psd`, `tga`, 
defaults write com.apple.screencapture type -string "png"

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Include date and time on screenshot name
defaults write com.apple.screencapture include-date -bool true

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true



#---- HOT CORNERS OPS --------------------------------------------------------#

# Possible values:
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



#---- TRASH ------------------------------------------------------------------#

# Permanently delete bin items after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false



#---- MAC APP STORE ----------------------------------------------------------#

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true



#---- ENERGY SAVING ----------------------------------------------------------# 

# Enable lid wakeup
sudo pmset -a lidwake 1

# Restart automatically on power loss
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 5 minutes on battery
sudo pmset -b sleep 5

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can be restored in case of a power failure.
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space, replacing it 
# with a readonluy zero-byte file instead
sudo rm /private/var/vm/sleepimage
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage



#---- TIME MACHINE -----------------------------------------------------------#

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal



#---- ACTIVITY MONITOR -------------------------------------------------------#

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Data update frequency in seconds: 1 (very frequent), 2 (frequent), 5 (default)
defaults write com.apple.ActivityMonitor UpdatePeriod -int 1

# Activity Monitor's Icon in the Dock:
# 0: regular icon
# 2: network activity (download / upload streams)
# 3: disk usage (read / write traffic)
# 5: current cpu usage
# 6: cpu usage history
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0



#---- SPOTLIGHT --------------------------------------------------------------#

# NOTE: Thinking to disable spotlight entirely, in favour of Alfred
# disable spotlight indexing for all volumes
# sudo mdutil -a -i off 

# Hide Spotlight tray-icon (and subsequent helper)
#sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Change indexing order and disable some search results
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 1;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "SOURCE";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
sudo mdutil -E / > /dev/null
