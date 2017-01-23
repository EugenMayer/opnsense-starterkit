#!/bin/sh

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg update
pkg upgrade -y
shutdown -p now
#echo 'autoboot_delay="0"' >> /boot/loader.conf