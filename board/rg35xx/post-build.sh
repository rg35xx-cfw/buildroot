#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
cp $BOARD_DIR/boot_logo.bmp.gz $BINARIES_DIR/boot_logo.bmp.gz 
cp $BOARD_DIR/adb_uImage $BINARIES_DIR/adb_uImage 
cp $BOARD_DIR/bootloader.img $BINARIES_DIR/bootloader.img
cp $BOARD_DIR/u-boot-dtb.img $BINARIES_DIR/u-boot-dtb.img
cp $BOARD_DIR/batocera-boot.conf $BINARIES_DIR/batocera-boot.conf
cp $BOARD_DIR/uInitrd $BINARIES_DIR/uInitrd
cp $BOARD_DIR/2100mAh-gpu.dtb $BINARIES_DIR/2100mAh-gpu.dtb
cp $BOARD_DIR/2600mAh-gpu.dtb $BINARIES_DIR/2600mAh-gpu.dtb

# We don't really need this but the batocera image script requires it
cp -r $BOARD_DIR/tools $BINARIES_DIR/

# Create empty swap partition
truncate -s 512M $BINARIES_DIR/swap.img
chmod 0600 $BINARIES_DIR/swap.img
mkswap $BINARIES_DIR/swap.img

