#!/bin/bash

cat <<EOF | tee /etc/network/interfaces
# ${1}
allow-hotplug ${1}
iface enp0s8 inet static
address ${2}
netmask 255.255.255.0
EOF

systemctl restart networking.service