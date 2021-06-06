#! /bin/bash

echo "Adresse IP : $(ip a show dev $(ip route show default | awk '/default/ {print $5}') | grep --color=none inet | grep -v inet6 | awk '{ print $2; }') | Adresse IP publique : $(curl -s ifconfig.me)" | tr '\n' ' '

