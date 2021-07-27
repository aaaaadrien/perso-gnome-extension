#! /bin/bash

mkdir -p $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com

rsync -avzh ./perso@aaaaadrien.github.com/ $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/

if [ ! -e  $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/modules-enabled.dat ]
then
	cp ./modules-enabled.dat $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/
fi
