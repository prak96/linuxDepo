#!/bin/bash

set -e

#update the system
sudo yum update -y && sudo yum upgrade -y

#Install GNOME
sudo yum groupinstall "GNOME Desktop"

#set the default target to graphical mode
sudo systemctl set-default graphical.target
sudo systemctl isolate graphical.target

#reboot to apply configuration
sudo reboot

#Enable xrdp package is available in the EPEL 
sudo yum install epel-release

#Install 'xrdp' for RDP connection
sudo yum install xrdp

#Enable & Start 'xrdp'
sudo systemctl enable xrdp
sudo systemctl start xrdp

#Open the RDP port (3389) in the firewall to allow incoming connections
echo "Configuring Firewall for RDP..."
sudo firewall-cmd --permanent --add-port=3389/tcp
sudo firewall-cmd -reload

#Confirm service status
sudo systemctl status xrdp

# Show IP info
echo "RDP setup completed on CentOS 7, Accessible IPs:"
ip a

echo ">>> Done."

