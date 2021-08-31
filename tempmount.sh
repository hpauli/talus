#!/usr/bin/bash
#***********************************************************
#ansible awx-pauli -m mount -a 'path=/tempmount state=mounted fstype=cifs src=//192.168.2.223/gruppe04$/fzr opts="user=Administrator,password=netapp112021,vers=2.0"'
#***********************************************************
cat /etc/fstab
mount

mkdir /tempmount/Appl
mkdir /tempmount/Daten
mkdir /tempmount/Daten/Abteilung
mkdir /tempmount/Daten/Gemeinde
mkdir /tempmount/Daten/Scan
mkdir /tempmount/FSProfiles
mkdir /tempmount/Scan
echo "************************************************"
ls -lisa /tempmount
echo "************************************************"
sleep 30
cat /etc/fstab

ansible awx-pauli -m mount -a 'path=/tempmount state=absent'

mkdir /tempmount


