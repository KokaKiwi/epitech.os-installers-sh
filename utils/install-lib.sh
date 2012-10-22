#!/bin/bash

source utils/logger.sh

function error_handler()
{
    ERR=$?
    if [ $ERR -ne 0 ]; then
        error "$1"
        exit 1
    fi
}

function epi-install()
{
    beg "apt-get" "$2"
    apt-get -qq -f -y -s install $1
    error_handler "Failed to install '$1'."
    end "apt-get" "$2"
}

function grab()
{
    beg "wget" "Pulling $1... [$2/$3]"
    if [ ! -f "$3" ]; then
        wget -q --no-check-certificate "$2/$3"
        error_handler "Error during pulling '3'."
        end "wget" "$1"
    else
        end "-" "Already have $1"
    fi
}

function deco()
{
    beg "tar" "Un-archiving $1..."
    tar xf $1
    error_handler "Error during un-archiving $1."
    end "tar" "$1"
}

function ask()
{
    echo -e -n "\r\033[1;34m${1} [\033[4;34myes\033[0m\033[1;34m/no]\033[0m "
    read answer
    if [ -z "$answer" ]; then
        answer='yes'
    fi
    if [ ${answer:-no} == 'yes' ]; then
        return 0
    else
        return 1
    fi
}

function copy()
{
    beg "cp" "$1"
    cp -r $2 $3
    error_handler "Erreur durant la copie des fichiers."
    end "cp" "$1"
}
