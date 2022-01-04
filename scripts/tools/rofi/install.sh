source ./scripts/common.sh

if [[ "$WITH_ROFI_CONFIG" == 'yes' || "$WITH_ROFI_CONFIG" == 'force' ]]; then
  if [[ -d "$HOME/.config/rofi" && "$WITH_ROFI_CONFIG" == 'force' ]]; then
    rm -rf "$HOME/.config/rofi"
    echo '[INFO] Rofi config removed | Forced by environment variable'
  fi
  if [[ ! -d "$HOME/.config/rofi" ]]; then
    ln -s "$CWD/configs/rofi" "$HOME/.config/rofi"
    echo "[INFO] Rofi config linked with symbolic link : $CWD/configs/rofi -> $HOME/.config/rofi"
  else
    echo '[INFO] Rofi config already linked'
  fi
fi