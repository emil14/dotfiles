#!/bin/bash

dependencies=(zsh rxvt-unicode git i3 nodejs)

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install ${dependencies}
