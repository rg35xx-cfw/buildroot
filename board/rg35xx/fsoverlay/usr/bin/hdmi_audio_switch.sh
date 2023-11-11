#!/bin/sh

if [[ $(cat /sys/devices/virtual/switch/hdmi/state) -eq 1 ]]; then
        sed -i "s/0,0/0,1/g" /etc/asound.conf
else
        sed -i "s/0,1/0,0/g" /etc/asound.conf
fi


