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
# /Intro }}}1

# Préparation des disques {{{1

# Partitionnement {{{2
# Avec cfdisk, création de deux partitions :
# /dev/sda1   2048-514047        512000     250M 83 Linux
# /dev/sda2 514048-488397167  487883120   232.7G 8e Linux LVM

# la première pour le boot, la deuxième pour LVM

# Partition de boot {{{2
mkfs.ext2 /dev/sda1

