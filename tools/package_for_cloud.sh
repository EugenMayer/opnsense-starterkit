#!/usr/bin/env bash
echo "converting to RAW"
mkdir -p output/cloud
VBoxManage convertdd output/virtualbox-iso/opnsense-disk001.vmdk output/cloud/disk.raw --format RAW