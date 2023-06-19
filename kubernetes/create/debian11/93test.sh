#!/bin/bash
SUDO_USER="naxo"
# todo ip table
sed -i 's/^deb cdrom/# deb cdrom/' /etc/apt/sources.list
chmod a+x ./*.sh
apt install -y vim git sudo 

usermod -aG sudo ${SUDO_USER}

./91static-ip.sh enp0s8 192.168.56.150
./master.sh > ./log.sh
./41kubectl-root.sh

# test
./92taint-control-plane.sh
kubectl apply -f ./yml/demo.yml
kubectl apply -f ./yml/service.yml