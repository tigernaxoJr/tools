#!/bin/bash
export OS=Debian_11
export VERSION=1.27
export CIDR="10.244.0.0"
export CRI_SOCKET=unix:///var/run/crio/crio.sock
#export ENDPOINT="192.168.56.150"

chmod a+x ./*.sh

./00disable-swap.sh
./01prequirement.sh
./11crio.sh
./21kubetools.sh
./31create-cluster.sh		