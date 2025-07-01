#!/bin/bash

sudo yum update && sudo yum upgrade -y


#install GNOME
sudo yum groupinstall "GNOME Desktop"
sudo systemctl set-default graphical.target

#reboot to appy the configuration
sudo reboot

#xrdp is available in the EPEL (Extra Package for Enterprise LINUX)
sudo yum install epel-release   

#Download & Install xrdp
sudo yum install xrdp
sudo systemctl start xrdp
sudo systemctl enable xrdp




