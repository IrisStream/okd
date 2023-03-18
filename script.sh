#!/bin/bash

# install vim
dnf update -y
dnf install -y vim

# Change connection name to device name
devices=$(nmcli -t -f NAME,DEVICE connection)

# Loop through devices
while read -r line; do
	name=$(echo "$line" | cut -d: -f1)
	device=$(echo "$line" | cut -d: -f2)
	echo "$name" "$device"
	if [ "$device" != "" ]; then
		nmcli connection modify "$name" connection.id "$device"
	fi
done <<< "$devices"