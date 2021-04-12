#!/bin/sh
apt install wget -y
apt install git -y
sleep 3
echo "Downloading Files..."
git clone https://github.com/hunt3rXhunt3r/dexter-v2ray
adb kill-server >/dev/null 2>&1
echo "Connecting to your modem ...."
adb connect 192.168.8.1:5555 >/dev/null 2>&1
adb devices -l | grep "192.168.8.1:5555" >/dev/null 2>&1
adb shell mount -o remount, rw /system
adb push busy/busybox /system/bin/
adb shell chmod 777 /system/bin/busybox
adb push busy/atong.tgz /tmp/
adb shell tar -xvf /tmp/atong.tgz -C /online/
adb shell chmod 777 /online/atong/v2ray/web/cgi-bin/*.*
adb shell rm  /online/atong/v2ray/web/index.html.gz
adb shell chmod 777 /tmp/installv2ray.sh
adb shell rm /online/atong/v2ray/config/configs/*.json
adb shell chmod 777 /online/atong/v2ray/bin/install.sh
adb shell sh /online/atong/v2ray/bin/install.sh
