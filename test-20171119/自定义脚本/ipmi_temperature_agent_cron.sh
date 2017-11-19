#!/usr/local/bin/bash -p
#cat /tmp/ipmi.out
#ipmitool -I open sensor list|grep 
#i=${RANDOM}
#let i=i%10
#echo $i
#echo $i>/tmp/ipmi.out
#cat /tmp/ipmi.out
#cat /tmp/ipmi_temperature_agent
ipmi_temp=$(ipmitool -I open sensor list|egrep -i "system temp|bb temp|inlet temp" |head -1|awk -F"|" '{print $2}'|awk -F"." '{print $1}'|awk '{print $1}')
if [ -n ${ipmi_temp} ];then
	
	echo "${ipmi_temp}">/tmp/ipmi_temperature_agent
fi
#cat /tmp/ipmi_temperature.out
