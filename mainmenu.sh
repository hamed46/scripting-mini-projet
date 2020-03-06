#! /bin/bash

function main () {
case $1 in

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
echo "Components of package: $pname"
dpkg-query -L "$pname" | xargs -n 1 basename

		;;
	-desc)
clear
echo "package name?"
read pname
descriptionnum=awk '/Description/{print NR}' sujet14.sh
echo "Description of package: $pname"
dpkg-query -s $pname

		;;
	-save)
clear
echo "package $pname installed"
echo "$pname" >> packagesnames.txt
		;;
	-help)
echo "Options:"
echo "-end)Quit"
echo "-inside)Afficher le nom de package dont une commande/fichier fait partie via <<nom_fichier>>."
echo "-list)Lister les composants d'un package via l'option <<nom_fichier>>."
echo "-desc)Afficher une description du package."
echo "Sauvegarder uniquement les noms de packages installes dans un fichier nommé packages_distribution_date.txt."
echo "-G)Conversation avec Zenity."
		;;
	-G)
zenity --info --text="Welcome!"
./mainsujet14.sh
		;;
	-end)
	echo "QUIT"
		;;
	*)
	echo "choix incorrecte"
		;;
esac
}
