#! /bin/bash

echo "Disques : / $(LANG=C df -h / | tail -1 | awk '{ print $5; }')     home $(LANG=C df -h /home | tail -1 | awk '{ print $5; }')" | tr '\n' ' '

