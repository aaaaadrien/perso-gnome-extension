#! /bin/bash

# Load Average
load=$(cat /proc/loadavg | awk '{ print $1" "$2" "$3 }')
# Uptime
#uptime=$(uptime | awk '{print $3; }' | tr ',' ' ' | sed -e 's/:/h /' | sed -e 's/ $//' | sed -e 's/$/m/')
uptime=$(uptime -p | sed -e "s/up //" |  sed -e "s/ hours/h/"  |  sed -e "s/ hour/h/"  |  sed -e "s/ days/j/"  |  sed -e "s/ day/j/" |  sed -e "s/ minutes/m/"  |  sed -e "s/ minute/m/")

echo " Load $load     Uptime $uptime" | tr '\n' ' '
