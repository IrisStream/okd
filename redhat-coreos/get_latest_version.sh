#!/bin/bash

is_local=$1

rhcos_url='https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/latest'

if [ "$is_local" == "local" ]; then
	iso_url=rhcos-live.x86_64.iso 
else
	iso_url=$rhcos_url/rhcos-live.x86_64.iso
fi
iso_checksum=$(curl -s $rhcos_url/sha256sum.txt | grep rhcos-live.x86_64.iso | awk '{print $1}')
raw_url=$rhcos_url/rhcos-live.x86_64.raw.gz

cat << EOF
{
	"iso_url": "$iso_url",
	"iso_checksum": "$iso_checksum",
	"raw_url": "$raw_url"
} 
EOF