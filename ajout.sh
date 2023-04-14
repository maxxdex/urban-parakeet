#!/bin/bash

            # Code pour ajouter des données
        
            read -p "Nom : " nom
            read -p "Adresse MAC : " mac0
            read -p "Adresse IP : " ip
            read -p "Masque (CIDR) : " cidr
            read -p "Type (1: machine; 2: switch; 3: serveur) : " libelle
            query="INSERT INTO Equipement (nom, adMAC, adIP, CIDR, idT) VALUES ('$nom', '$mac', '$ip', $cidr, $libelle);"
            echo "Récapitulatif de la requete : > $query"
            read -p "Confirmer l'insertion (0/n) : " confirm
            if [ "$confirm" == "0" ]; then
                mysql -u sissa22 -pSaandati59 -D donnees -e "$query"
                echo "Les saisies ont été intégrées à la base de données"
                read -p "[Appuyer sur entrer pour continuer]" continue
            else
                echo "L'insertion a été annulée"
                read -p "[Appuyer sur entrer pour continuer]" continue
            fi
   
