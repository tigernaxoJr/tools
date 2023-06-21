#!/bin/bash
# todo ip table
sed -i 's/^deb cdrom/# deb cdrom/' /etc/apt/sources.list
chmod a+x ./*.sh
apt-get install -y vim git sudo 


./91static-ip.sh enp0s8 192.168.56.150
./master.sh | tee ./log.sh
./40kubectl-config.sh

# give kubectl privileges to the sudo user
SUDO_USER="naxo"
usermod -aG sudo ${SUDO_USER}
./40kubectl-config.sh ${SUDO_USER}

# test
./92taint-control-plane.sh
# kubectl create -f ./yml/demo.yml
# kubectl create -f ./yml/service.yml
