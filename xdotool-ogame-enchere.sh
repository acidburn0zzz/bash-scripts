#! /bin/bash

# ce script permet en un appui sur la touche entrée d'enchérir
# rapidement sur le jeu Ogame sur la page du commissaire priseur.

# Nécessite l'outil xdotool
# Pour capturer les coordonnées des boutons, placer la souris dessus
# et exécuter la commande xdotool getmouselocation

# Avec Chromium sur écran 1920x1080 en haut de page
console=$(xdotool getactivewindow)
enchere=$1

case "$enchere" in
        "m")
                echo Script initialisé avec enchères de métal
                ;;
        "c")
                echo Script initialisé avec enchères de cristal
                ;;
        "d")
                echo Script initialisé avec enchères de deutérium
                ;;
        *)
                echo Script non initialisé. Passer m c ou d en paramètres
                exit 2
                ;;
esac

while :
do

        #Pause on attend l'appui sur la touche
        read choix

        ok=1
        if [[ "$choix" != "" ]]
        then
                enchere=$choix
        fi

        case "$enchere" in
                "m")
                        # On deplace la souris sur le bouton métal
                        echo Enchere Métal
                        xdotool mousemove 1250 752
                        ;;
                "c")
                        # On deplace la souris sur le bouton cristal
                        echo Enchere Cristal
                        xdotool mousemove 1250 810
                        ;;
                "d")
                        echo Enchere Deutérium
                        xdotool mousemove 1250 870
                        ;;
                *)
                        echo Echec de l enchère
                        ok=0
                        ;;
        esac

        if [ $ok -eq 1 ]
        then
                # On clique
                xdotool click 1

                # On déplace la souris sur Faire une enchère
                xdotool mousemove 1183 1045

                # on clique
                xdotool click 1

                #on reselectionne la fenêtre de console pour avoir la main pour lancer une nouvelle enchere
                xdotool  windowactivate $console
                xdotool  windowactivate $console
                xdotool  windowactivate $console
        fi

done
