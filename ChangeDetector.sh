#!/bin/bash
#
#futtatás előtt telepíteni kell az imagemagick csomagot
#sudo apt-get install imagemagick
#
#ird ide, hogy milyen időközönként ellenőrizze a képernyőt
sl=9
echo "Válts a figyelendő alkalmazás ablakára és legyen képernyő közepén,"
echo "vagy vedd ki a #jelet a firefox sorból így a szkript folyamatosan frissíti"
echo "a figyelendő weblapot!"
# ezt allitsd be, hogy a firefox ne nyisson mindig uj tabot
# https://support.mozilla.org/en-US/questions/1226151
sleep $sl
gnome-screenshot -f screenshot1.png
mogrify -crop 300x300+400+150 screenshot1.png
#ird ide, hogy hányszor fusson a vizsgálat
for i in {1..1}
do
firefox http://www.fsz.bme.hu/cgi-bin/ltime
sleep $sl
gnome-screenshot -f screenshot2.png
mogrify -crop 300x300+400+150 screenshot2.png
screenshot1filesize=$(stat -c '%s' screenshot1.png)
screenshot2filesize=$(stat -c '%s' screenshot2.png)
echo "screenshot1filesize = $screenshot1filesize", "screenshot2filesize = $screenshot2filesize"
if [ $screenshot1filesize -eq $screenshot2filesize ]; then
    echo a megfigyelt kepernyoterulet nem valtozott
    else paplay incoming_im.wav
fi
mv screenshot2.png screenshot1.png
sleep $sl
done
rm screenshot1.png
echo vége