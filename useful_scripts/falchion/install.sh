#!/bin/bash
sudo curl https://raw.githubusercontent.com/mrdev023/linux-conf/main/useful_scripts/falchion/99-asus-falchion.hwdb -o /etc/udev/hwdb.d/99-asus-falchion.hwdb
sudo systemd-hwdb update