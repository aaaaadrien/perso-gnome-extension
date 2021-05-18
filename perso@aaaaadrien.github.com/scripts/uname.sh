#! /bin/bash

# Uname
uname=$(uname -sr)

echo "Noyau : $uname" | tr '\n' ' '
