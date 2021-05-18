#! /bin/bash

vmstat=$(vmstat 1 1 | tail -1)
# Utilisation CPU (100 - idle)
cpuused=$(echo $vmstat | awk '{ print 100-$15"%"; }')
#User
cpuuser=$(echo $vmstat | awk '{ print $13"%"; }')
# system
cpusys=$(echo $vmstat | awk '{ print $14"%"; }')
# Wait
cpuwait=$(echo $vmstat | awk '{ print $16"%"; }')

echo "$cpuused  ( U $cpuuser    S $cpusys    W $cpuwait )" | tr '\n' ' '
