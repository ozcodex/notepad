# Installation Journal
----------------------

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
  desk/
  docs/
    templates/
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

## Change the display backlight level

the file `/sys/class/backlight/intel_backlight/brightness` contains the light
level of the backlight, can be changed directly with sudo but cannot be less
than 0 or more than the max level, spicified by a file in the same folder

## Install the latest NodeJS

using the nodesource setup script, just have to download it and run it as root.

`curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh`

## Setup Bluetooth

Download firmware file and copi it to
`/lib/firmware/brcm/BCM43341B0.hcd`

Create systemd service file
`sudo vi /etc/systemd/system/btattach.service`
with the following content:
```
[Unit]
Description=Btattach

[Service]
Type=simple
ExecStart=/usr/bin/btattach --bredr /dev/ttyS1 -P bcm
ExecStop=/usr/bin/killall btattach

[Install]
WantedBy=multi-user.target
```
Enable service
`systemctl enable btattach`

## Setup Audio

configure modprod file and reinstall pulseaudio, alsamixer and pavucontrol

wget -qO- https://gist.github.com/heikomat/3fe272431b44b580c933bfb901a92257/raw | bash

????? pacmd set-default-sink $(pactl list short sinks | grep cx2072x | cut -c1)

git clone https://github.com/Borys64/X205TAudio
cd X205TAudio
sudo bash script.sh

# Instaled Software
-------------------

To work properly on my very own projects, for fun, or serving any other purpose
I have installed this software on my machine and I want to keep a record of it.

* git: Very well known version manager
* nodejs: multipurpose execution enviroment for JS.wget -qO- https://gist.github.com/heikomat/3fe272431b44b580c933bfb901a92257/raw | bash
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
* freesweep: minesweeper game
* printer-driver-all: utilities and drivers to print
* hp-ppd: drivers for hp printers
* hplip: (source) to have the latest hp drivers
* fbi: to display images using the framebuffer
* fbcat: takes screenshots to ppm format
* gpm: general prupouse mouse
* libsane-hpaio: hp scanner drivers
* kiwix: (source) to serve zim files
* mirconucleus: (source) to comunicate with attiny85
* libusb-dev: to make micronucleus work
* python3-pip: package manager for python
* arduino-cli: (source) arduino tools
* nmap: to chock devices over network
* neofetch: shows sistem information
* upgrade-system: to upgrade debian

### Python Apps installed

This apps are istaled through pip installer.

* esptool: Communication wit Wemos and ESP devices
* setuptools: needed for esptools

### Node Apps installed

This apps are instaled with the global flag of npm

* express-generator: generador para applicaciones express
* heroku: client to connect heroku
* prettier: js code formater

### Graphical Interface Apps 

* network-manager
* nm-tray
* xfce4-battery-plugin
* xfce4-terminal
* xfce4-screenshooter
* mousepad: text editor
* ristretto: image viewer
* firefox-esr: internet browser
* dosbox: for play old DOS games
* xdg-user-dirs: to setup the user directories
* 7zip
* aptitude: to try to handle broken packages
* menulibre: to customize the main menu
* xfce4-power-manager
* blueman
* vlc
* xinput
* grub-customizer

### Games Installed

* flare
* micropolis
* nethack-x11 
* freedoom
* openarena
* minetest
* adonthell
* freedink
* freedroid
* manaplus
* openttd
* singularity
* ardentryst
* bomberclone
* freegish
* geki2
* geki3
* mousetrap
* supertux
* boswars
* uqm
* assaultcube
* freeorion
* freeciv
* Lightyears
* pingus
* warmux
* supertuxkart
* 7kaa


# Graphical Inferface
----------------------

To have a working graphical interface, xfce4 was installed, with minimal
adittional software, then manually installed the packages listed below.

## Touchpad config
disabled while typing was enabled by default.
`xinput` to list devices and get the device id (12 in this case)
`xinput list-props 12` to get all the settings available (322 is the one i was looking for)
`xinput set-prop 12 322 0`  disable the setting

## Disable suspend and hibernate buttons
```
xfconf-query -c xfce4-session -np '/shutdown/ShowSuspend' -t 'bool' -s 'false' 
xfconf-query -c xfce4-session -np '/shutdown/ShowHibernate' -t 'bool' -s 'false' 
```

## Fix Assaultcube error 11
edit `/usr/share/games/assaultcube/config/autoexec.cfg` and add `ati_mda_bug 1`

## enable autologin in lightdm

edit the file /etc/lightdm/lightdm.conf setting the configurations:

```
autologin-user=ozcodex
autologin-user-timeout=0
```

# Doing a Debian System upgrade
-------------------------------

## from strech to buster

first upgrade all packages
```
apt-get update
apt-get upgrade
apt-get dist-upgrade
```

then backup the source list
`cp /etc/apt/sources.list /etc/apt/sources.list_backup`

change the repository in sources file
sed -i 's/stretch/buster/g' /etc/apt/sources.list

run the command `upgrade-system` and cross fingers

## from buster to bullseye

change buster to bullseye
and buster/security to bullseye-updates/security
in source.list file

## Removes

picom
adonthell
geki2
freeciv
greed
warmux
7kaa
openttd
freedink
bomberclone
boswars
freedroid
freegish
ardentryst
dosbox
flare
