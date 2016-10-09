#! /bin/bash

pathdata="/media/DATA/"
pathsav="/run/media/$USER/BACKUP/"


echo $pathdata
read -p "Le chemin source est bon ?"
echo $pathsav
read -p "Le chemin destination est bon ?"

time rsync -a --stats --progress --delete-during "$pathdata" "$pathsav"

echo "------------------------"

echo Verification des différences entre les fichiers de la source et de la destination...

time diff -rqH "$pathdata" "$pathsav"

echo Verification terminee
