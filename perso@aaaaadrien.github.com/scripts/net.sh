#! /bin/bash

# IPV4 Address
net4lan=$(ip a show dev eth0 | grep --color=none inet | grep -v inet6 | awk '{ print $2; }' )

echo "$net4lan" | tr '\n' ' '
