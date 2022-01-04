source ./scripts/common.sh

if [[ "$WINDOW_MANAGER" == 'i3' ]]; then
  if ! command_exists i3; then
    install_package i3-wm
    echo '[INFO] I3 installed'

    if [[ "$WITH_WINDOW_MANAGER_DEPENDENCIES" == 'yes' ]]; then
      #install_package ripgrep fd dart lazygit rust-analyzer lldb
    fi
  else
    echo '[INFO] I3 already installed'
  fi

  if [[ "$WITH_WINDOW_MANAGER_CONFIG" == 'yes' || "$WITH_WINDOW_MANAGER_CONFIG" == 'force' ]]; then
    if [[ -d "$HOME/.config/i3" && "$WITH_WINDOW_MANAGER_CONFIG" == 'force' ]]; then
      rm -rf "$HOME/.config/i3"
      echo '[INFO] I3 config removed | Forced by environment variable'
    fi
    if [[ ! -d "$HOME/.config/i3" ]]; then
      ln -s "$CWD/configs/i3" "$HOME/.config/i3"
      echo "[INFO] I3 config linked with symbolic link : $CWD/configs/i3 -> $HOME/.config/i3"
    else
      echo '[INFO] I3 config already linked'
    fi
  fi
fi