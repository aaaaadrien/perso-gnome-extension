#! /bin/bash

ping -W 1 -4 -c 1 ifconfig.me > /dev/null 2>&1

if [[ "$?" == "0" ]]; then
  echo "$(curl -s ifconfig.me)" | tr '\n' ' '
fi
