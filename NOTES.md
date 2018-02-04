# Notes

## Possible future cards

- Faster movements (`forever > if key 'right arrow' pressed > move`; because `on key pressed` reacts a bit slowly)
- 15 puzzle (4 pages)

## Install Debian Testing on older Laptops

- Get the Nightly Debian Netinst for Testing and put it on an usb stick
- Install Debian with LXQt as the Desktop Manager
- `apt install vim sudo aptitude`
- `update-alternatives --config editor"
- Add the "coderdojo" user to the sudoers.
- `Preferences > Settings > Session Settings > Autostart`: add "Connman" as `cmst -w5 -m` and `[x] Wait for system tray`
- `lspci` to get the wifi card installed
  - if `Intel Corporation Centrino Wireless-N 1000 [Condor Peak]` you need to install the `non-free` repositories and then `firmware-iwlwifi`.
- add `pepperflashplugin-nonfree` and `browser-plugin-freshplayer-pepperflash`
