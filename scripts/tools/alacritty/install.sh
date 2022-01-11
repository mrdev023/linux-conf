#!/bin/bash
source ./scripts/common.sh

if [[ "$WITH_ALACRITTY_CONFIG" == 'yes' || "$WITH_ALACRITTY_CONFIG" == 'force' ]]; then
  if [[ -d "$HOME/.config/alacritty" && "$WITH_ALACRITTY_CONFIG" == 'force' ]]; then
    rm -rf "$HOME/.config/alacritty"
    echo '[INFO] Alacritty config removed | Forced by environment variable'
  fi
  if [[ ! -d "$HOME/.config/alacritty" ]]; then
    ln -s "$CWD/configs/alacritty" "$HOME/.config/alacritty"
    echo "[INFO] Alacritty config linked with symbolic link : $CWD/configs/alacritty -> $HOME/.config/alacritty"
  else
    echo '[INFO] Alacritty config already linked'
  fi
fi