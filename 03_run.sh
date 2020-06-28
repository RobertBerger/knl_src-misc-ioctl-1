MODULE_NAME=misc_char_drv
DEVICE_NAME=mycdrv
USER_SPACE=user_space

if [ "$(id -u)" == "0" ]; then
  unset SUDO
else
  SUDO=sudo 
fi

echo "+ $SUDO killall -9 klogd"
$SUDO killall -9 klogd

echo "+ $SUDO cat /proc/kmsg &"
$SUDO cat /proc/kmsg &

echo "+ $SUDO rm -f /dev/$DEVICE_NAME"
$SUDO rm -f /dev/$DEVICE_NAME

echo "+ $SUDO insmod $MODULE_NAME.ko"
$SUDO insmod $MODULE_NAME.ko

echo "+ ls -la /dev/$DEVICE_NAME"
ls -la /dev/$DEVICE_NAME

echo "+ $SUDO chmod 666 /dev/$DEVICE_NAME"
$SUDO chmod 666 /dev/$DEVICE_NAME

echo "+ ls -la /dev/$DEVICE_NAME"
ls -la /dev/$DEVICE_NAME

echo "+ ./${USER_SPACE} /dev/$DEVICE_NAME 0 30"
./${USER_SPACE} /dev/$DEVICE_NAME 0 30

echo "+ $SUDO rmmod $MODULE_NAME.ko"
$SUDO rmmod $MODULE_NAME.ko

echo "+ $SUDO killall -9 cat"
$SUDO killall -9 cat

echo "+ restart klogd"
echo "+ /etc/init.d/syslog stop"
$SUDO /etc/init.d/syslog stop

echo "+ /etc/init.d/syslog start"
$SUDO /etc/init.d/syslog start


