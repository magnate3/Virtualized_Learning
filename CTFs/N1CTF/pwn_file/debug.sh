#!/bin/bash

pwd=`pwd`

gdb --args ./qemu-system-x86_64 \
	-initrd ${pwd}/rootfs.cpio -nographic -kernel ${pwd}/kernel-guest \
	-L ${pwd}/pc-bios -append "priority=low console=ttyS0 loglevel=3 kaslr" \
	-drive file=${pwd}/nvme.raw,format=raw,if=none,id=Dxx -device nvme,drive=Dxx,serial=1234 \
	-monitor /dev/null
