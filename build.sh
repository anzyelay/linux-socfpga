#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export LOADADDR=0X8000
make -j4 zImage
test $? || exit 1
make dtbs
test $? || exit 1
# 对于附加dtb到内核上去，可以用cat *.dtb > zImage,生成的zImage可以直接用bootz启动
# 类似的，uImage+dtb则不行，要先生成附加了dtb的zImage->make uImage->uImage才可用
#uImage+dtb可搜FIT-uImage
cat arch/arm/boot/dts/socfpga_arria5_socdk.dtb >> arch/arm/boot/zImage
make uImage
cp -v arch/arm/boot/uImage ~/ftp/
#cp -v arch/arm/boot/dts/socfpga_arria5_socdk.dtb ~/ftp/
exit 0
