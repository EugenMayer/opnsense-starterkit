#!/bin/sh
opnsense-update
shutdown -p now
#echo 'autoboot_delay="0"' >> /boot/loader.conf