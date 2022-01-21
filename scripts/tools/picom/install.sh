source ./scripts/common.sh

if [[ "$WITH_PICOM_CONFIG" == 'yes' || "$WITH_PICOM_CONFIG" == 'force' ]]; then
  if [[ -d "$HOME/.config/picom" && "$WITH_PICOM_CONFIG" == 'force' ]]; then
    rm -rf "$HOME/.config/picom"
    echo '[INFO] Picom config removed | Forced by environment variable'
  fi
  if [[ ! -d "$HOME/.config/picom" ]]; then
    ln -s "$CWD/configs/picom" "$HOME/.config/picom"
    echo "[INFO] Picom config linked with symbolic link : $CWD/configs/picom -> $HOME/.config/picom"
  else
    echo '[INFO] Picom config already linked'
  fi
fi
