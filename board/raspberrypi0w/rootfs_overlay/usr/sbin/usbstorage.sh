#!/bin/sh
#
# Start usb storage
#

FILE="/dev/mmcblk0p3"
READONLY=""
#READONLY="ro=1"

case "$1" in
  start)
	printf "Starting usb storage: "
        umount $FILE
	modprobe g_mass_storage file=$FILE $READONLY
	[ $? = 0 ] && echo "OK" || echo "FAIL"
	;;
  stop)
	printf "Stopping usb storage: "
	modprobe -r g_mass_storage
        mount $FILE /mnt -o uid=1001,gid=1001
	[ $? = 1 ] && echo "OK" || echo "FAIL"
	;;
  restart|reload)
	"$0" stop
	"$0" start
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?

