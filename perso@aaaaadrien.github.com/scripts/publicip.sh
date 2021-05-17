#! /bin/bash

# IPV4 Address
publicip=$(dig @resolver4.opendns.com myip.opendns.com +short)

echo "publicip"
