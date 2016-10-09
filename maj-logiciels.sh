#! /bin/bash

# Dernière modif le 11/09/2015
# Firefox ESR : https://www.mozilla.org/en-US/firefox/organizations/all/?q=French,%20Fran%C3%A7ais
# Java : http://www.java.com/fr/download/manual.jsp
# Flash : http://www.adobe.com/products/flashplayer/distribution3.html
# LibreOffice : https://download.documentfoundation.org/libreoffice/stable
cd $(dirname $0)

echo Vérification et Téléchargement de Firefox
dest="Firefox"
mkdir "$dest"
url="http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest-esr/win32/fr/"
wget -r --no-parent --no-directories -A exe -N $url -P "$dest"
chmod -R 777 "$dest"

echo Vérification et Téléchargement de Thunderbird
dest="Thunderbird"
mkdir "$dest"
url="http://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/latest/win32/fr/"
wget -r --no-parent --no-directories -A exe -N $url -P "$dest"
chmod -R 777 "$dest"

echo Vérification et Téléchargement de Flash Player
dest="FlashPlayer"
mkdir "$dest"
echo Internet Explorer
url="https://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_18_active_x.exe"
wget -r --no-parent --no-directories -A exe -N $url -P "$dest"
echo Firefox
url="https://fpdownload.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_18_plugin.exe"
wget -r --no-parent --no-directories -A exe -N $url -P "$dest"
chmod -R 777 "$dest"

echo Vérification et Téléchargement de Java
dest="Java"
mkdir "$dest"
echo 32 bits
url=$(wget -O - -q http://www.java.com/fr/download/manual.jsp | grep AutoDL | grep 'Windows Hors ligne' | head -1 | cut -d'"' -f4)
wget -r --no-parent --no-directories -A exe -N $url -O "$dest/java-latest-32bits.exe"
echo 64 bits
url=$(wget -O - -q http://www.java.com/fr/download/manual.jsp | grep AutoDL | grep 'Windows (64' | head -1 | cut -d'"' -f4)
wget -r --no-parent --no-directories -A exe -N $url -O "$dest/java-latest-64bits.exe"
chmod -R 777 "$dest"

echo Vérification et Téléchargement de LibreOffice
dest="LibreOffice"
mkdir "$dest"
ver=$(wget -qO- 'https://download.documentfoundation.org/libreoffice/stable/' --no-check-certificate | grep '<tr><td valign="top">&nbsp;</td><td><a href="' | tail -n 1 | sed 's/.*\([0-9]\.[0-9]\.[0-9]\).*/\1/')
echo 32 bits
exe="_Win_x86.msi"
url="https://download.documentfoundation.org/libreoffice/stable/$ver/win/x86/LibreOffice_$ver$exe"
wget -r --no-parent --no-directories -A msi -N "$url" -P "$dest"
echo 64 bits
exe="_Win_x64.msi"
url="https://download.documentfoundation.org/libreoffice/stable/$ver/win/x86_64/LibreOffice_$ver$exe"
wget -r --no-parent --no-directories -A msi -N "$url" -P "$dest"
chmod -R 777 "$dest"
