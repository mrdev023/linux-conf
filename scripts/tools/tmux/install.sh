
source ./scripts/common.sh

if [[ "$WITH_TMUX_CONFIG" == 'yes' || "$WITH_TMUX_CONFIG" == 'force' ]]; then
  if [[ -d "$HOME/.tmux.conf" && "$WITH_TMUX_CONFIG" == 'force' ]]; then
    rm -rf "$HOME/.tmux.conf"
    echo '[INFO] Tmux config removed | Forced by environment variable'
  fi
  if [[ ! -d "$HOME/.tmux.conf" ]]; then
    ln -s "$CWD/configs/tmux/tmux.conf" "$HOME/.tmux.conf"
    echo "[INFO] Tmux config linked with symbolic link : $CWD/configs/tmux/tmux.conf -> $HOME/.tmux.conf"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo '[INFO] Tmux plugin manager cloned'
  else
    echo '[INFO] Tmux config already linked'
  fi
fi
