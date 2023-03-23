#! /bin/bash

is_local=$1

set -e

if [ ! -f id_rsa ]; then
	curl -o id_rsa https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant
fi

./get_latest_version.sh $is_local > vars.json
hash=$(sha256sum http/ignition.cfg | awk '{ print $1 }')

packer build -var-file vars.json -var ignition_hash="--ignition-hash sha256-$hash" .