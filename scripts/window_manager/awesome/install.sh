source ./scripts/common.sh

if [[ "$WINDOW_MANAGER" == 'awesome' ]]; then
  if ! command_exists awesome; then
    install_package awesome
    echo '[INFO] Awesome installed'

    if [[ "$WITH_WINDOW_MANAGER_DEPENDENCIES" == 'yes' ]]; then
      install_package alacritty rofi
    fi
  else
    echo '[INFO] Awesome already installed'
  fi

  if [[ "$WITH_WINDOW_MANAGER_CONFIG" == 'yes' || "$WITH_WINDOW_MANAGER_CONFIG" == 'force' ]]; then
    if [[ -d "$HOME/.config/awesome" && "$WITH_WINDOW_MANAGER_CONFIG" == 'force' ]]; then
      rm -rf "$HOME/.config/awesome"
      echo '[INFO] Awesome config removed | Forced by environment variable'
    fi
    if [[ ! -d "$HOME/.config/awesome" ]]; then
      ln -s "$CWD/configs/awesome" "$HOME/.config/awesome"
      echo "[INFO] Awesome config linked with symbolic link : $CWD/configs/awesome -> $HOME/.config/awesome"
    else
      echo '[INFO] Awesome config already linked'
    fi
  fi
fi