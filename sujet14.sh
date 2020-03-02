#!/bin/sh

while [ "$choix" != "-end" ]
do

echo "votre choix?"
read choix

case $choix in

	-inside)
echo "nom du Commande/fichier?"
read filename

clear
echo "File/Command's path:"
locate $filename


dpkg-query --search locate $filename | tail -1 | cut -d' ' -f1
pname=$(dpkg-query --search locate $filename | tail -1 | cut -d' ' -f1 | sed 's/.$//')
clear
echo "Name of package:"
echo "$pname"

		;;
	-list)
echo "package name?"
read pname

clear
echo "Components of package:"
dpkg-query -L "$pname" | xargs -n 1 basename

		;;
	-desc)
clear
echo "package name?"
read pname
descriptionnum=awk '/Description/{print NR}' sujet14.sh
echo "Description of package:"
dpkg-query -s $pname

		;;
	-save)
clear
echo "package installed"
echo "$pname" >> packagesnames.txt
		;;
	-end)
	echo "QUIT"
		;;
	*)
	echo "choix incorrecte"
		;;
esac
done

