#!/bin/sh

CWD=$(pwd)
[ ! -f "$HOME/.config/nvim" ] && ln -s "$CWD/nvim" "$HOME/.config/nvim"
[ ! -f "$HOME/.config/i3" ] && ln -s "$CWD/i3" "$HOME/.config/i3"
[ ! -f "$HOME/.config/lazygit" ] && ln -s "$CWD/lazygit" "$HOME/.config/lazygit"
[ ! -f "$HOME/.config/awesome" ] && ln -s "$CWD/awesome" "$HOME/.config/awesome"
