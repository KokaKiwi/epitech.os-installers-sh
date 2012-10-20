#!/bin/bash

source utils/logger.sh

function header()
{
    echo -n -e "\033[1;36m"
    echo "#########################################################################"
    echo "#                   Epitech shell script installer                      #"
    echo "#                           version 0.1.0                               #"
    echo "#########################################################################"
    echo ""
    echo "Attention! Vous devez etre connecte a Internet afin d'utiliser ce script!"
    echo "Verifiez que vous etes netsoul si vous etes dans l'ecole!"
    echo ""
    echo -n -e "\033[0m"
}
