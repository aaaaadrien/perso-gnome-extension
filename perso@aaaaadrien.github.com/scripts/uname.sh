#! /bin/bash

# Uname
uname=$(uname -sr)

echo "$uname" | tr '\n' ' '
