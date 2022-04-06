#! /bin/bash

mkdir -p $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com

rsync -avzh --delete ./perso@aaaaadrien.github.com/ $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/

