## Micropython On the Wemos D1 mini (ESP8266 4Mb)

Starting from a fresh board
when connected appears on /dev/ttyUSB0

With python installed and the esptool pip package

Downloaded the firmware from 
https://micropython.org/download/esp8266/

because a lack of permissions I had to add my user to the 
sudo usermod -a -G dialout oz

then I can erase the flash memory
esptool.py --port /dev/ttyUSB0 erase_flash

preceed to install the firmware
esptool.py --port /dev/ttyUSB0 --baud 115200 write_flash --flash_size=4MB -fm dio 0 ./Downloads/esp8266-20220618-v1.19.1.bin

now REPL can be connected throw minicom
minicom -D /dev/ttyUSB0 -b 115200

There are a power issue that is solved dissabling the default Access Point.
so disabling the default AP is required.

import network; network.WLAN(network.AP_IF).active(False)

then the interactive shell should be working without problems, even after restart the board.

### Notes

pin 2 is the on board led can be controled by
```
led=Signal(Pin(2, Pin.OUT), invert=True)
led.on()
led.off
```

## Micropython On the TTGO T-Watch 2020 (ESP32 16Mb)

the baud rate of this board seems to be 460800

for some reason flashing the firmware was harder than I expected.

Taking the firmware from https://github.com/russhughes/st7789_mpy
and using thonny to upload it seems to work.

the code examples are from https://nick.zoic.org/art/lilygo-ttgo-t-watch-2020/

