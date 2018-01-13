cd /

cat << EOF > etc/resolv.conf
search google.internal
nameserver 169.254.169.254
nameserver 8.8.8.8
EOF

cat << EOF > boot/loader.conf
autoboot_delay="-1"
beastie_disable="YES"
loader_logo="none"
hw.memtest.tests="0"
console="comconsole"
hw.vtnet.mq_disable=1
kern.timecounter.hardware=ACPI-safe
aesni_load="YES"
nvme_load="YES"
EOF

cat << EOF >> etc/hosts
169.254.169.254 metadata.google.internal metadata
EOF

cat << EOF > etc/ntp.conf
server metadata.google.internal iburst

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery

restrict 127.0.0.1
restrict -6 ::1
restrict 127.127.1.0
EOF

cat << EOF >> etc/syslog.conf
*.err;kern.warning;auth.notice;mail.crit                /dev/console
EOF

ifconfig em0 mtu 1460
