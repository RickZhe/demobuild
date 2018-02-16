#!/bin/bash

### BEGIN INIT INFO
# Provides:          iptable
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: iptable
# Description:       iptable
### END INIT INFO

iptables --table nat -A POSTROUTING -o ens160 -j MASQUERADE
iptables -A FORWARD -i ens192 -o ens160 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i ens160 -o ens192 -j ACCEPT

echo "Allow vlan99 internet access"
