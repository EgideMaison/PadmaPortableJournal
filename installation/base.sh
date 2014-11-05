#!/bin/bash
# Intro {{{1
#=============================================== vim: set fdm=marker: ====
#
#          FILE:  base.sh
# 
#         USAGE:  ./base.sh 
# 
#   DESCRIPTION:  Script d'installation pour archlinux
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Egide Dey egide.github@rnv.ch
#       COMPANY:  Ponthaux, Suisse
#       CREATED:  17. 10. 14 20:45:08 CEST
#        SOURCE:  https://github.com/EgideMaison/PadmaPortableJournal
#=========================================================================

# Gestion des erreurs {{{1
# La commande à un argument, ce qui sera affiché sur la ligne de commande.
gest_err(){
	if [ $? -eq 0 ]
	then
		echo "Il n'y a pas d'erreur"
	else
		echo "$1"
	fi
	exit 1
}

# Préparation des disques {{{1

# Partitionnement {{{2
# Avec cfdisk, création de deux partitions :
# /dev/sda1   2048-514047        512000     250M 83 Linux
# /dev/sda2 514048-488397167  487883120   232.7G 8e Linux LVM

# la première pour le boot, la deuxième pour LVM

# Partition de boot {{{2
mkfs.ext2 /dev/sda1

# LVM {{{2
# création du groupe physique
pvcreate /dev/sda2

# création du groupe logique
vgcreate ddsdd /dev/sda2

# Création des volumes logiques
lvcreate -L 20G ddsdd -n racine
lvcreate -L 150G ddsdd -n docs

mkfs.ext4 -L racine /dev/ddsdd/racine
mkfs.ext4 -L docs /dev/ddsdd/docs

# Montage de disques {{{2
mount /dev/ddsdd/racine /mnt

# Créations des dossiers racines pour les montages
mkdir -p /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/ddsdd/docs /mnt/home

