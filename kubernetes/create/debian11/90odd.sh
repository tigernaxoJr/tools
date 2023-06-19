#!/bin/bash
# disalbe cdrom source
sed -i 's/^deb cdrom/# deb cdrom/' /etc/apt/sources.list

chmod a+x ./*.sh
apt install -y vim git sudo 

usermod -aG sudo ${SUDO_USER}