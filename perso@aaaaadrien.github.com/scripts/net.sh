#! /bin/bash

# Auto detect lan interface based on the default route.
lan_interface=$(ip route show default | awk '/default/ {print $5}')

# IPV4 Address
net4lan=$(ip a show dev $lan_interface | grep --color=none inet | grep -v inet6 | awk '{ print $2; }' )

echo "$net4lan" | tr '\n' ' '
