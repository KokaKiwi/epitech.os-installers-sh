#!/bin/bash

source utils/install-lib.sh
source utils/epilib.sh

header

info "Verification de la connection a Internet..."
wget http://google.fr -o /dev/null -O /dev/null
error_handler "Impossible de se connecter a Internet!\n\
Verifiez votre connexion!"

PLATEFORM=`uname -i`

if ask "Voulez-vous continuer?"; then
    source "targets/$1.sh"
fi
