#!/bin/bash
# todo ip table
sed -i 's/^deb cdrom/# deb cdrom/' /etc/apt/sources.list
chmod a+x ./*.sh
apt install -y vim git sudo 


./91static-ip.sh enp0s8 192.168.56.150
./master.sh > ./log.sh
./41kubectl-root.sh

# test
./92taint-control-plane.sh
kubectl create -f ./yml/demo.yml
kubectl create -f ./yml/service.yml

# give kubectl privileges to the sudo user
SUDO_USER="naxo"
usermod -aG sudo ${SUDO_USER}
cp ./40kubectl-non-root.sh /tmp/kubectl-non-root.sh 
su - ${SUDO_USER} -c "bash /tmp/40kubectl-non-root.sh"