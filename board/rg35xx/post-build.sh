#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
cp $BOARD_DIR/boot_logo.bmp.gz $BINARIES_DIR/boot_logo.bmp.gz 
cp $BOARD_DIR/adb_uImage $BINARIES_DIR/adb_uImage 
cp $BOARD_DIR/bootloader.img $BINARIES_DIR/bootloader.img
cp $BOARD_DIR/u-boot-dtb.img $BINARIES_DIR/u-boot-dtb.img
