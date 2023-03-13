#!/bin/bash

curl -s https://raw.githubusercontent.com/coreos/fedora-coreos-streams/main/streams/stable.json | 
jq '.architectures.x86_64.artifacts.metal.formats | 
  {
	iso_url: .["iso"].disk.location,
	iso_checksum: .["iso"].disk.sha256,
	ignition_url: "https://raw.githubusercontent.com/IrisStream/okd/main/fedora-coreos-packer/ignition.cfg?token=GHSAT0AAAAAAB75DJHY5MSRH4ESPEQ4ISBGZAPLEEQ",
	raw_url: .["raw.xz"].disk.location
  }'