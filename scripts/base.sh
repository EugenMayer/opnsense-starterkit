#!/bin/sh
opnsense upgrade
shutdown -p now
#echo 'autoboot_delay="0"' >> /boot/loader.conf