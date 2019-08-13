#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export LOADADDR=0X8000
make -j4 uImage
test $? || exit 1
make dtbs
test $? || exit 1
cp -v arch/arm/boot/uImage ~/ftp/
cp -v arch/arm/boot/dts/socfpga_arria5_socdk.dtb ~/ftp/
exit 0
