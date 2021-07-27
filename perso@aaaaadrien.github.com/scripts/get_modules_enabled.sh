#!/bin/bash

LIST=$(cat $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/modules-enabled.dat  | tr  '\n' ' ')
echo $LIST $LIST | tr  '\n' ' '
