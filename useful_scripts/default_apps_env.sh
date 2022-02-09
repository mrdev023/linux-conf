#!/bin/bash
sudo sed -i -e "s/BROWSER=.*/BROWSER=microsoft-edge-stable/g" /etc/environment
sudo sed -i -e "s/EDITOR=.*/EDITOR=vim/g" /etc/environment
