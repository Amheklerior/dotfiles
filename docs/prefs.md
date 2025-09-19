# Preferences

- [MacOS system](#macos-system)
- [Ghostty](#ghostty)
- [VSCode](#vscode)
- [Raycast](#raycast)
- [Todoist](#todoist)
- [Notion](#notion)
- [Telegram](#telegram)
- [AltTab](#alttab)
- [KeyClu](#keyclu)
- [Hidden Bar](#hidden-bar)
- [Nuphy Air75 keyboard layout](#nuphy-air75-keyboard-layout)

> **! NOTE**\
> Still need to find a way to reliably save Mail, Notes, Contacts, Safari, and Photos apps' preferences.

## MacOS System

MacOS system preferences are set via the [`/prefs/macos/defaults.sh`](/prefs/macos/defaults.sh) script. The script is automatically run by the bootstrap script, but you can source the [`load-sys-prefs.sh`](/scripts/load_sys_prefs.sh) script to load the system preferences yourself.

## Ghostty

The [Ghostty](https://ghostty.org/) terminal emulator reads its preferences from a [`$XDG_CONFIG_HOME/ghostty/config` file](/dotfiles/.config/ghostty/config), which gets symlinked alongside all other dotfiles.

## VSCode

Visual Studio Code reads user preferences from the [`settings.json`](/prefs/vscode/settings.json) file, user's specific key bindings from the [`keybindings.json`](/prefs/vscode/keybindings.json) file, and user's specified snippets from the [`snippets`](/prefs/vscode/snippets/) dir, under the `$HOME/Library/Application Support/Code/User/` dir.

All three files are defined under the [`/prefs/vscode`](/prefs/vscode/) dir, and symlinked with Stow to the `$HOME/Library/Application Support/Code/User/` dir by the [`/prefs/apps/vscode-settings.sh`](/prefs/apps/vscode-settings.sh) script.

The script is automatically run by the [`load-app-prefs.sh`](/scripts/load_app_prefs.sh) script, but you can always source it manually from shell to load the preferences yourself.

## Raycast

[Raycast](https://www.raycast.com/) preferences are exported in a `.rayconfig` file stored under the [`/prefs/raycast`](/prefs/raycast/) dir.

Open Raycast and go to `settings (⌘ + ,)` > `Advanced` > `Import/Export`, and import the preferences file.

## Todoist

Todoist's settings are stored in cloud by the service provider.

## Notion

Notion's settings are stored in cloud by the service provider.

## Telegram

_TODO_

## AltTab

The [Alt-tab](https://alt-tab-macos.netlify.app/) app reads its preferences from the `/Library/Preferences/com.lwouis.alt-tab-macos.plist` file (associated with the `com.lwouis.alt-tab-macos` domain).

The [`alt-tab-settings.sh`](/prefs/apps/alt-tab-settings.sh) script sets `alt-tab` preferences by updating directly the plist file using the `defaults` command.

The script is automatically run by the [`load-app-prefs.sh`](/scripts/load_app_prefs.sh) script, but you can always source it manually from shell to load the preferences yourself.

## Keyclu

The KeyClu app reads its preferences from the  `/Library/Preferences/com.0804Team.KeyClu.plist` file (associated with the `com.0804Team.KeyClu` domain).

The [`keyclu-settings.sh`](/prefs/apps/keyclu-settings.sh) script sets `keyclu` preferences by updating directly the plist file using the `defaults` command.

The script is automatically run by the [`load-app-prefs.sh`](/scripts/load_app_prefs.sh) script, but you can always source it manually from shell to load the preferences yourself.

## Hidden Bar

The [HiddenBar](https://github.com/dwarvesv/hidden) app reads its preferences from the  `Library/Containers/com.dwarvesv.minimalbar/Data/Library/Preferences/com.dwarvesv.minimalbar.plist` file (associated with the `com.dwarvesv.minimalbar` domain).

The [`hiddenbar-settings.sh`](/prefs/apps/hiddenbar-settings.sh) script sets `hiddenbar` preferences by updating directly the plist file using the `defaults` command.

The script is automatically run by the [`load-app-prefs.sh`](/scripts/load_app_prefs.sh) script, but you can always source it manually from shell to load the preferences yourself.

## Nuphy Air75 Keyboard Layout

There's no need to do anything unless further changes are desired, as the keyboard is already setup.

If further customization is needed:

1. Connect the keyboard via USB cable (keyboard should be set to wired mode)
2. Go to [usevia.app](https://usevia.app/)
3. Go to the `Settings` tab and toggle the 'show design tab' switch on
4. Go tho the `Design` tab ad drag the [keyboard layout .json file](/prefs/kbd/nuphy-air75-v2.json)
5. Go to the `Configure` tab > `SAVE + LOAD` section and load the [customization .json file](/prefs/kbd/mappings-and-macros.json)

> _checkout the [official guide](https://nuphy.com/pages/via-usage-guide-for-nuphy-keyboards) for more detail_

## Linear

Linear settings are stored in cloud. Hence, there's nothing to be done.

Just in case the custom color theme gets lost, it is saved in json format within the repo. To apply it:

1. Open Linear app
2. Go to `preferences` > `interface and theme` > `sharing`
3. Click `import theme` and paste the content of the [`prefs/linear/theme.json`](../prefs/linear/theme.json) file
