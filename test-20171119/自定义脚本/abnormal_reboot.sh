#!/bin/bash

msg=$(grep -i -B1 "/proc/kmsg started" /var/log/kernel | tail -2 | head -1)
echo ${msg} | grep -i "kernel log daemon terminating" 2>/dev/null
if [ $? -ne 0 ];then
	#abnormal reboot
	echo "abnormal reboot"
	exit 1
else
	#normal reboot.include "kernel log daemon terminating"
	echo "OK"
	exit 0
fi
