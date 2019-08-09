#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export LOADADDR=0X8000
make -j4 uImage
make dtbs
cp -v arch/arm/boot/uImage ~/ftp/
cp -v arch/arm/boot/dts/socfpga_arria5_socdk.dtb ~/ftp/
