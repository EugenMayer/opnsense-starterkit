#!/bin/sh
echo "upgrading opnsense"
opnsense-update

echo "cleanup"
opnsense-update -e

shutdown -p now
#echo 'autoboot_delay="0"' >> /boot/loader.conf