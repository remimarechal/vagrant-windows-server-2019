#!/bin/bash
set -e

vagrant_token="$1"

rm -fv win2019-*.box 
packer build -var "$vagrant_token" . 
vagrant box add --force --name windows-server-2019-standard-desktop win2019-*.box