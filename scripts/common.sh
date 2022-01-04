#!/bin/bash
command_exists () {
  type "$1" &> /dev/null
}

install_package () {
  if [[ "$PM" == 'pacman' ]]; then
    sudo pacman -S --noconfirm "$@"
    echo "[INFO] Finished to install $@"
  else
    echo '[ERROR] Package manager not supported' >&2
  fi
}

remove_package () {
  if [[ "$PM" == 'pacman' ]]; then
    sudo pacman -R --noconfirm "$@"
    echo "[INFO] Finished to remove $@"
  else
    echo '[ERROR] Package manager not supported' >&2
  fi
}