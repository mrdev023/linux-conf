#!/bin/bash
source ./scripts/common.sh

if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | awk '/=/ {print $1}') 
    echo "[INFO] Environment file loaded"
fi
export OS_NAME=`cat /etc/os-release | grep "^NAME=" | sed 's/NAME=//g' | sed 's/"//g'`
export OS_NAME=${OS_NAME,,} # LOWERCASE
export CWD=$(pwd)

# Initialize

## Detect current package manager
command_exists pacman && export PM=pacman

if ! [[ -z "${PM}" ]]; then
  echo "[INFO] Package manager set to : $PM"
else
  echo '[ERROR] No package manager found. Aborting...' >&2
fi


find ./scripts -type f -iname "*.sh" -exec chmod +x {} \;

# Install and configure functionality
./scripts/tools/neovim/install.sh