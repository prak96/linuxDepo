#!/bin/bash

sudo apt update && sudo apt upgrade -y

#Install 'xfce' Desktop Environment
sudo apt install xfce4 xfce4-goodies -y

#Install 'xrdp'
sudo yum install xrdp -y

#Set 'xfce' as the Default Desktop for xrdp
echo "startxfce4" | sudo tee /etc/skel/.session

