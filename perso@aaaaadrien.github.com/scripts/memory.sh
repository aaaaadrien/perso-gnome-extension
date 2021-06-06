#! /bin/bash

echo "Mémoire : RAM $(LANG=C free -h | head -2 | tail -1 | awk '{ print $3"/"$2; }' | sed -e 's/i//g') $(LANG=C free -m | head -2 | tail -1 | awk '{ print "("int($3/$2*100) "%)"; }' | sed -e 's/i//g')     SWAP $(LANG=C free -h | tail -1 | awk '{ print $3"/"$2; }' | sed -e 's/i//g') $(LANG=C free -m | tail -1 | awk '{ print "("int($3/$2*100) "%)"; }' | sed -e 's/i//g') " | tr '\n' ' '

