# Installation Journal

Based on a fresh debian installation
This are the steps used to configure the powerful x205ta machine.

## Network Connection
Set-up the wlan0 interface
`ip link set wlan0 up`

See the available connections
`iwlist scan`

To connect to a WEP network use:
`iwconfig wlan0 essid NETWORK-ESSID`
`iwconfig wlan0 key PASSWORD` or `iwconfig wlan0 key s:PASSWORD` if the key is ASCII

To connect to a WPA network you need to:
generate a hash code of the password:
`wpa_passphrase NETWORK-ESSID PASSWORD`

then edit `/etc/network/interfaces`
and add this interface at the end of the file:
```
iface wlan0 inet dhcp 
  wpa-ssid NETWORK-ESSID
  wpa-psk HASHCODE
```
then start the interface: `ifup wlan0`

it's possible to use logical interfaces changing the 'iface wlan0' with 'iface config1'
or any other name, an then use `ifup wlan0=config1` to start

## Keyboard Configuration
it's required to install `keyboard-configuration` and `console-setup` packages
after the install it ask to selectthe keyboard layout, but you can cahnge it using:
`dpkg-reconfigure

## Directory Structure
The directory structure that I like to use is formed by 3-5 letters names with the 
characteristic that the first 2 letters combination is unique in the folder
```
home/
  docs/
  tmp/
  media/
    pics/
    vids/
    music/
  code/
```

## Linking config files
To complete the configuration I clone this repo and link the config files (such as gitconfig
or aliases) to the ones on this repo.
to do this y use symbolic links (a.k.a. soft links) using `ln -s homefile repofile`

## Sudo configuration
After the installation and first run of sudo, I like to disable the password check on
each run, so i execute `sudo visudo`, this opens the configuration of sudo.
for avoid the pasword check I add this line at the end of the file:
```
ozcodex ALL=(ALL) NOPASSWD=ALL
```

