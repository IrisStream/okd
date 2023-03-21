#!/bin/bash

if [ ! -f id_rsa ]; then
	curl -o id_rsa https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant
fi

packer build -var-file vars.json .

# vagrant box add -f --name centos8-stream centos8-stream-x86_64.box