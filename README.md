# USB Mass Storage with Network based on a RaspberryPiZeroW

The idea behind this project is to have a USB mass storage device that is network accessible.
The PiZW will emulate a USB mass storage device using it's USB OTG port.
The USB connection of the PiZW will be plugged into something like a SmartTV, the SmartTV will just
see a USB flash drive.
The neat thing is that you can transfer files to that flash drive from your computer without physically unplugging
the PiZW.

This works like in the following:
- plug PiZW into target device
- ssh user@PiZW -C su -c /usr/sbin/usbstorage.sh start (PiZW is recognized as a USB device)
- ssh user@PiZW -C su -c /usr/sbin/usbstorage.sh stop (USB device is disconnected)
- scp file.avi user@PiZW:/mnt (copy avi file into the flash partition)
- ssh user@PiZW -C su -c /usr/sbin/usbstorage.sh start (PiZW is recognized as a USB device)

## Build

Get Buildroot 2018.02 from https://buildroot.org/download.html

checkout this repository

```
mkdir out
cd out
make O=$PWD -C ../buildroot/ BR2_EXTERNAL=../usbnetstore/ rbpizw_usbnetstore_defconfig
make
```

## Install on SD card
```
cd images
dd if=sdcard.img of=/dev/mmcblk0 (adjust for your SD card)
```
Now you just need to create a data partition using the leftover space on the SD card.

## Usage 

Adjust /etc/wpa_supplicate.conf for your Wifi network

Adjust /etc/network/interfaces for your network

You can do this before building in usbnetstore/board/raspberrypi0w/rootfs_overlay
or from a console (if you have a monitor and keyboard attached to your PiZW)

### Passwords
root has now password

user account 'user' with password 'rpzwusbnet'
