#!/bin/sh

killall joyaudio

amixer -q set "speaker on off switch" "off"

rm /boot/boot/reboot

sync

shutdown -Ph -t 3 now

