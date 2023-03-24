#!/bin/bash

is_local=$1

rhcos_url='https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/latest'

if [ "$is_local" == "local" ]; then
	iso_url=rhcos-live.x86_64.iso 
	raw_url=rhcos-metal.x86_64.raw.gz
else
	iso_url=$rhcos_url/rhcos-live.x86_64.iso
	raw_url=$rhcos_url/rhcos-metal.x86_64.raw.gz
fi
iso_checksum=$(curl -s $rhcos_url/sha256sum.txt | grep rhcos-live.x86_64.iso | awk '{print $1}')

cat << EOF
{
	"iso_url": "$iso_url",
	"iso_checksum": "$iso_checksum",
	"ignition_url": "ignition.cfg",
	"raw_url": "$raw_url"
} 
EOF
	# "ignition_url": "https://raw.githubusercontent.com/IrisStream/okd/main/redhat-coreos/ignition.cfg",