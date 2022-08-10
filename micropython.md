## On the Wemos D1 mini (ESP8266 4Mb)

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
esptool.py --port /dev/ttyUSB0 --baud 1000000 write_flash --flash_size=4MB -fm dio 0 ./Downloads/esp8266-20220618-v1.19.1.bin

