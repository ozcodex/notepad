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
`iwconfig wlan0 key PASSWORD` or `iwconfig wlan0 key s:PASSWORD` if key is ASCII

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

it's possible to use logical interfaces changing the 'iface wlan0' with 
'iface config1' or any other name, an then use `ifup wlan0=config1` to start

## Keyboard Configuration
it's required to install `keyboard-configuration` and `console-setup` packages
after the install it ask to select the keyboard layout, but can be changed using:
`dpkg-reconfigure`

## Directory Structure
The reccomended directory structure is formed by 3-5 letters names with the 
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
To complete the configuration I clone this repo and link the config files (such 
as gitconfig or aliases) to the ones on this repo.
to do this use symbolic links (a.k.a. soft links), those can be created with:
`ln -s homefile repofile`

## Privileges configuration
After the installation and first run of sudo, the password check of sudo can be
dissabled, to prevent having to write the password on each run, execute
`sudo visudo` to open the configuration of sudo, and add this line:
```
ozcodex ALL=(ALL) NOPASSWD=ALL
```

Add user to disk group so USB Sticks can be managed.

```
sudo usermod -G disk -a ozcodex

```
## Make the sd card reader to work
copy the file sdhci.config to /etc/modprobe.d/
then run the command 
```
update-initramfs -u -k all
```
and reboot the machine

## Modify the Welcome message

Copy the motd file to `/etc/motd`
This file was build using toilet, figlet and linuxlogo

## Setup the battery control

Add a crontab rule to run the `script/battery_check` each 15 minutes.

To prevent the system to hang on "halted" state when powering off, and avoid
printing warnings in the console, add the next kernel params to grub:

```
acpi=force loglevel=1
```

Also edit the file `/etc/systemd/logind.conf` to control the behaviour of the
laptop lid and the power button.

```
[Login]
HandlePowerKey=poweroff
HandleSuspendKey=poweroff
HandleLidSwitch=ignore

```

## Change the dsplay backlight level

the file `/sys/class/backlight/intel_backlight/brightness` contains the light
level of the backlight, can be changed directly with sudo but cannot be less
than 0 or more than the max level, spicified by a file in the same folder

# Instaled Software

To work properly on my very own projects, for fun, or serving any other purpose
I have installed this software on my machine and I want to keep a record of it.

* git: Very well known version manager
* nodejs: multipurpose execution enviroment for JS.
* linuxlogo, fidlet, toilet: text banners utility
* openssh-server: ssh tunnel connection
* build-essencials: to compile software
* acpitool: to manage the power interfaces
* zerotier: to access remotely to the network
* frotz: z-machine emulator to play zork
* zip: manage compressed files
* bsdgames: a collection of text based games
* bastet: a text based tetris game
* nudoku: sudoku game
* greed: puzzle game
* gnuchess: chess game
* cmatrix: screensaver
* curseofwar: real time strategy game
* ninvaders: space invaders clone
* empire: war simulator game
