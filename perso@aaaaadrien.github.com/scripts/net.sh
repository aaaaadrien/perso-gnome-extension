#! /bin/bash

# IPV4 Address
interface=$(ip route get 8.8.8.8 | sed -nr 's/.*dev ([^\ ]+).*/\1/p')
net4lan=$(ip a show dev $interface | grep --color=none inet | grep -v inet6 | awk '{ print $2; }' )

echo "$net4lan" | tr '\n' ' '
