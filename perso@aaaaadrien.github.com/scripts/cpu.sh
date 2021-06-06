#! /bin/bash

echo "CPU : $(echo $(vmstat 1 1 | tail -1) | awk '{ print 100-$15"%"; }')  ( U $(echo $(vmstat 1 1 | tail -1) | awk '{ print $13"%"; }')    S $(echo $(vmstat 1 1 | tail -1) | awk '{ print $14"%"; }')    W $(echo $(vmstat 1 1 | tail -1) | awk '{ print $16"%"; }') )" | tr '\n' ' '

