#!/bin/bash

dependencies=(rxvt-unicode)

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install ${dependencies}
