# Extension perso GNOME
Extension personnelle pour GNOME SHELL qui affiche des vues différentes dans la barre des tâches. Les vues affichent des informations système.

Cette extension :
- NE dispose PAS d'installer
- N'est PAS à compiler
- NE fonctionnera PAS chez vous sans être adaptée
- est codée en MODE CRADO

Cependant, si vous voulez faire un PULL REQUEST pour intégrer des variables dans mon code, c'est avec grand plaisir !


Installation :

Exécuter le script install.sh
L'extension sera installée dans $HOME/.local/share/gnome-shell/extensions/
Après installation, redémarrer sa session GNOME (ou Alt+F2 et saisir r puis Entrée si vous n'utilisez pas Wayland)
Il sera nécessaire de l'activer via GNOME Ajustements ou GNOME Extension (à partir de GNOME40).

Désinstallation :

Exécuter le script uninstall.sh
Vous pouvez aussi supprimer le dossier perso@aaaaadrien.github.com dans $HOME/.local/share/gnome-shell/extensions


Configuration :

Il suffit de personnaliser le fichier $HOME/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/modules-enabled.dat
Indiquer sur chacune des lignes les modules à activer parmi : 
title
uname
disk
sys
cpu
memory
net
sensor
