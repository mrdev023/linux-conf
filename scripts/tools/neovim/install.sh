source ./scripts/common.sh

if [[ "$WITH_NEOVIM" == 'yes' ]]; then
  if ! command_exists nvim; then
    install_package neovim
    echo '[INFO] Neovim installed'
  else
    echo '[INFO] Neovim already installed'
  fi

  if [[ "$WITH_CUSTOM_LAZYGIT_CONFIG" == 'yes' || "$WITH_CUSTOM_LAZYGIT_CONFIG" == 'force' ]]; then
    if [[ -d "$HOME/.config/lazygit" && "$WITH_CUSTOM_LAZYGIT_CONFIG" == 'force' ]]; then
      rm -rf "$HOME/.config/lazygit"
      echo '[INFO] Lazygit config removed | Forced by environment variable'
    fi
    if [[ ! -d "$HOME/.config/lazygit" ]]; then
      ln -s "$CWD/configs/lazygit" "$HOME/.config/lazygit"
      echo "[INFO] Lazygit config linked with symbolic link : $CWD/configs/lazygit -> $HOME/.config/lazygit"
    else
      echo '[INFO] Lazygit config already linked'
    fi
  fi

  if [[ "$WITH_CUSTOM_NEOVIM_CONFIG" == 'yes' || "$WITH_CUSTOM_NEOVIM_CONFIG" == 'force' ]]; then
    if [[ -d "$HOME/.config/nvim" && "$WITH_CUSTOM_NEOVIM_CONFIG" == 'force' ]]; then
      rm -rf "$HOME/.config/nvim"
      echo '[INFO] Neovim config removed | Forced by environment variable'
    fi
    if [[ ! -d "$HOME/.config/nvim" ]]; then
      ln -s "$CWD/configs/nvim" "$HOME/.config/nvim"
      echo "[INFO] Neovim config linked with symbolic link : $CWD/configs/nvim -> $HOME/.config/nvim"
    else
      echo '[INFO] Neovim config already linked'
    fi
  fi
else
  echo '[INFO] WITH_NEOVIM not equals to yes. Ignoring...'
fi