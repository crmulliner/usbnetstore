
/dev/mmcblkp3 is your data partition
  
/usr/sbin/usbstorage.sh controls USB mass storage emulation
edit the file to set:
  a different partition or file as the emulated USB storage device
  the device to ReadOnly mode

turn on USB mass storage emulation
  /usr/sbin/usbstorage.sh start 

turn OFF USB mass storage emulation
  /usr/sbin/usbstorage.sh stop
  will mount data partition in to /mnt


# Network Configuration

edit /etc/wpa_supplication.conf to add your SSID and Password
edit /etc/network/interfaces to set IP and gateway
