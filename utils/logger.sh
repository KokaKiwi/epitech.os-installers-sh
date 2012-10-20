#!/bin/bash

. utils/cpad.sh

function info()
{
    CMD=`cpad "$1" $CPAD_SIZE " "`
    echo -e -n "\r\033[1;34m${CMD}${2}\033[0m\n"
}

function error()
{
    echo -e -n "\033[1;31m${1}\033[0m\n"
}

function beg()
{
    CMD=`cpad "$1" $CPAD_SIZE " "`
    echo -e -n "\033[32m${CMD}${2}\033[0m\n"
}

function end()
{
    CMD=`cpad "$1" $CPAD_SIZE " "`
    echo -e -n "\r\033[A\033[1;32m${CMD}${2}\033[0m\033[K\n"
}
