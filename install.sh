#! /bin/bash

#Permet de remplacer Adrien par votre nom d'utilisateur lors de l'éxécution de l'extension
sed -i "s/Adrien/"$USER"/g" perso@aaaaadrien.github.com/extension.js

#Modifie les information de l'extension
sed -i "s/Adrien/"$USER"/g" perso@aaaaadrien.github.com/metadata.json

cp -r ./perso@aaaaadrien.github.com $HOME/.local/share/gnome-shell/extensions/
