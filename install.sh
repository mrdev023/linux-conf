#!/bin/bash

OS_NAME=`cat /etc/os-release | grep "^NAME=" | sed 's/NAME=//g' | sed 's/"//g'`
OS_NAME=${OS_NAME^^} # UPPERCASE

case $OS_NAME in
    "UBUNTU")
        source ./install_scripts/ubuntu.sh
        start
        ;;
    *)
        echo "OS not supported"
        ;;
esac