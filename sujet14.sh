#!/bin/sh

#while [ "$choix" != "-end" ]
#do

#echo "votre choix?"
#read choix

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
esac

while [ "$choix1" != 4 ]
do
echo "----------------MENU PRINCIPAL------------------"
echo "1)-Gestionnaire des packages"
echo "2)-Sauvegard"
echo "3)-Help?"
echo "4)-Quit?"
echo "------------------------------------------------"
echo "Votre choix?"
read choix1




case $choix1 in
	1)
echo "----------------SOUS MENU1-----------------------"
echo "-inside"
echo "-list"
echo "-desc"
echo "-end"
echo "-------------------------------------------------"
echo "Votre choix?"
read choix2



case $choix2 in
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
	-end)
echo "Quit"
		;;
	*)
echo "choix incorrecte"
		;;
esac
		;;
	2)
echo "----------------SOUS MENU2-----------------------"
echo "1)-save"
echo "2)-end"
echo "-------------------------------------------------"
echo "Votre choix?"
read choix3
case $choix3 in
	-save)
clear
echo "package $pname installed"
echo "$pname" >> packagesnames.txt
	;;
	-end)
echo "Quit"
	;;
	*)
echo "choix incorrecte"
	;;
esac
	;;



	3)
echo "Options:"
echo "-end)Quit"
echo "-inside)Afficher le nom de package dont une commande/fichier fait partie via <<nom_fichier>>."
echo "-list)Lister les composants d'un package via l'option <<nom_fichier>>."
echo "-desc)Afficher une description du package."
echo "Sauvegarder uniquement les noms de packages installes dans un fichier nommé packages_distribution_date.txt"
	;;


	4)
	echo "QUIT"
		;;
	*)
	echo "choix incorrecte"
		;;
esac
done



