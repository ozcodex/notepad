# Installation Journal

Based on a fresh debian installation
This are the steps used to configure the powerful x205ta machine.

## Network Connection
Set-up the wlan0 interface
`ip link set wlan0 up`

See the available connections
`iwlist scan`

## Keyboard Configuration
it's required to install `keyboard-configuration` and `console-setup` packages
