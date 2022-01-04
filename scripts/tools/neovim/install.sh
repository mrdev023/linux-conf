source ./scripts/common.sh

if [[ "$WITH_NEOVIM" == 'yes' ]]; then
  if ! command_exists nvim; then
    install_package neovim
    echo '[INFO] Neovim installed'
  else
    echo '[INFO] Neovim already installed'
  fi

  if [[ ! -d "$HOME/.config/nvim" ]]; then
    ln -s "$CWD/configs/nvim" "$HOME/.config/nvim"
    echo "[INFO] Neovim config linked with symbolic link : $CWD/configs/nvim -> $HOME/.config/nvim"

    install_package ripgrep fd dart lazygit rust-analyzer lldb
  else
    echo '[INFO] Neovim config already linked'
  fi
else
  echo '[INFO] WITH_NEOVIM not equals to yes. Ignoring...'
fi