#! /bin/bash

code=$(wget -O - -q http://www.wikebec.org/ | grep accueil-mdj-title)

mot=$(echo $code | cut -d">" -f10 | cut -d"<" -f1)
def=$(echo $code | cut -d">" -f13 | cut -d"<" -f1)

echo Le mot du jour «$mot» : $def
