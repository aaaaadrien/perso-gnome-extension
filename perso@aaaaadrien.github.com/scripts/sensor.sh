#! /bin/bash

# ajout primaire du contrôle de la température cpu / gpu
# fonctionne uniquement pour config AMD (ryzen + radeon)
# -> a compléter si vous avez une config intel et/ou nvidia
# si rien ne s'affiche, pensez à faire une fois la commande -> sudo sensors-detect
cputemp=$(sensors | grep Tdie | awk '{ print $2; }' | sed -e 's/i//g')
gputemp=$(sensors | grep edge | awk '{ print $2; }' | sed -e 's/i//g')

echo "CPU $cputemp     GPU $gputemp"