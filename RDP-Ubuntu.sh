#!/bin/bash

set -e

echo "[Ubuntu 24.04] tarting RDP setup..."
sudo apt update && sudo apt upgrade -y

#Install 'xfce' Desktop Environment
sudo apt install xfce4 xfce4-goodies -y

#Install 'xrdp'
sudo yum install xrdp -y

#Enable & start xrdp
sudo systemctl enable xrdp
sudo systemctl start xrdp

#Set XFCE as default session
echo "Configuring XFCE session for xrdp..."
echo "startxfce4" | tee -a ~/.session
chmod +x ~/.session

#Modify startwm.sh
sudo sed -i.bak '/Xsession/s/^/#/' /etc/xrdp/startwm.sh
echo "startxfce4" | sudo tee -a /etc/xrdp/startwm.sh


# Add xrdp user to ssl-cert group
sudo adduser xrdp ssl-cert

# Restart Service
sudo systemctl restart xrdp

#Configure Firewall if active
if sudo ufw status | grep -qw active; then
    echo ">>> UFW active. Allowing RDP port..."
    sudo ufw allow 3389/tcp
fi

#Confirm service status
echo ">>> RDP setup complete. xrdp status:"
sudo systemctl status xrdp --no-pager
echo ">>> IP addresses:"
ip a | grep -i "inet"

echo ">>> [Ubuntu 24.04] RDP is ready! "



