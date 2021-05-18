#! /bin/bash

# Memoire
mem=$(LANG=C free -h | head -2 | tail -1 | awk '{ print $3"/"$2; }' | sed -e 's/i//g')
# mémoire utilisée en %
mempc=$(LANG=C free -m | head -2 | tail -1 | awk '{ print "("int($3/$2*100) "%)"; }' | sed -e 's/i//g')

swap=$(LANG=C free -h | tail -1 | awk '{ print $3"/"$2; }' | sed -e 's/i//g')
# Swap utilisée en %
swappc=$(LANG=C free -m | tail -1 | awk '{ print "("int($3/$2*100) "%)"; }' | sed -e 's/i//g')

echo "RAM $mem $mempc     SWAP $swap $swappc " | tr '\n' ' '
