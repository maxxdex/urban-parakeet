# urban-parakeet
Projet MyGest IOn'R

#!/bin/bash

#script de vérfication au bon fonctionnement du programme
echo "installation des elements essentiels du programme"
for package in "${packages_to_install[@]}"
do
    if dpkg-query -W "$package" >/dev/null 2>&1; then
        echo "$package est déjà installé"
    else 
        echo "installattion de $package ..."
        sudo apt-get install -y "$package"    
echo " tous les elements essentiels du programme sont installés " 

#script de disctinction entre machine serveur et cliente
if  [[ $hostnamectl | grep "Operating System: ") == *"Server"* ]]; then 
    IS_SERVER=true 
else 
    IS_SERVER=false 
fi


CONFIG_FILE="config.sh"
if [ -e $CONFIG_FILE ]; then 
    rm $CONFIG_FILE
fi
touch $CONFIG_FILE 
if [ "$IS_SERVER" = true ]; then
    echo "SERVER=true" >> $CONFIG_FILE
else 
    echo "SERVER=false" >> $CONFIG_FILE
fi

if [ "$IS_SERVER" = false ]; then 
  if [ ! -x "$(command -v lolcat)"]; then
    echo " La fonctionnalité lolcat n'est pas installé, l'installation est en cours... "
    sudo apt-get upadate && sudo apt-get install lolcat -y  
fi
