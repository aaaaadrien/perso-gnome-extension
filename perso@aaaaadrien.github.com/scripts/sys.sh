#! /bin/bash

echo "Système :  Load $(cat /proc/loadavg | awk '{ print $1" "$2" "$3 }')     Uptime $(uptime -p | sed -e "s/up //" |  sed -e "s/ hours/h/"  |  sed -e "s/ hour/h/"  |  sed -e "s/ days/j/"  |  sed -e "s/ day/j/" |  sed -e "s/ minutes/m/"  |  sed -e "s/ minute/m/")" | tr '\n' ' '

