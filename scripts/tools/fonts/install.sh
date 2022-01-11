#!/bin/bash
source ./scripts/common.sh

install_font() {
  FILE=$(basename $1)
  FROM="./fonts/$1.ttf"
  TO="/usr/share/fonts/$FILE.ttf"
  sudo cp "$FROM" "$TO"
  sudo chmod 444 "$TO"
  echo "[INFO] $1 Font installed"
}

apply_fonts () {
  fc-cache -f
  echo "[INFO] Font cache generated"
}

install_font CascadiaCodePL
install_font CascadiaCodePLItalic
install_font DelugiaComplete-Bold
install_font DelugiaComplete-BoldItalic
install_font DelugiaComplete-Italic
install_font DelugiaCompleteLight-Italic
install_font DelugiaCompleteLight
install_font DelugiaComplete
install_font FiraCode-Bold
install_font FiraCode-Light
install_font FiraCode-Medium
install_font FiraCode-Regular
install_font FiraCode-Retina
install_font FiraCode-SemiBold
install_font FiraCode/Fira-Code-Bold-Nerd-Font-Complete-Mono
install_font FiraCode/Fira-Code-Bold-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fira-Code-Bold-Nerd-Font-Complete
install_font FiraCode/Fira-Code-Bold-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fira-Code-Light-Nerd-Font-Complete-Mono
install_font FiraCode/Fira-Code-Light-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fira-Code-Light-Nerd-Font-Complete
install_font FiraCode/Fira-Code-Light-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fira-Code-Medium-Nerd-Font-Complete-Mono
install_font FiraCode/Fira-Code-Medium-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fira-Code-Medium-Nerd-Font-Complete
install_font FiraCode/Fira-Code-Medium-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fira-Code-Regular-Nerd-Font-Complete-Mono
install_font FiraCode/Fira-Code-Regular-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fira-Code-Regular-Nerd-Font-Complete
install_font FiraCode/Fira-Code-Regular-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fira-Code-Retina-Nerd-Font-Complete-Mono
install_font FiraCode/Fira-Code-Retina-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fira-Code-Retina-Nerd-Font-Complete
install_font FiraCode/Fira-Code-Retina-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fura-Code-Bold-Nerd-Font-Complete-Mono
install_font FiraCode/Fura-Code-Bold-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fura-Code-Bold-Nerd-Font-Complete
install_font FiraCode/Fura-Code-Bold-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fura-Code-Light-Nerd-Font-Complete-Mono
install_font FiraCode/Fura-Code-Light-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fura-Code-Light-Nerd-Font-Complete
install_font FiraCode/Fura-Code-Light-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fura-Code-Medium-Nerd-Font-Complete-Mono
install_font FiraCode/Fura-Code-Medium-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fura-Code-Medium-Nerd-Font-Complete
install_font FiraCode/Fura-Code-Medium-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fura-Code-Regular-Nerd-Font-Complete-Mono
install_font FiraCode/Fura-Code-Regular-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fura-Code-Regular-Nerd-Font-Complete
install_font FiraCode/Fura-Code-Regular-Nerd-Font-Complete-Windows-Compatible
install_font FiraCode/Fura-Code-Retina-Nerd-Font-Complete-Mono
install_font FiraCode/Fura-Code-Retina-Nerd-Font-Complete-Mono-Windows-Compatible
install_font FiraCode/Fura-Code-Retina-Nerd-Font-Complete
install_font FiraCode/Fura-Code-Retina-Nerd-Font-Complete-Windows-Compatible

apply_fonts