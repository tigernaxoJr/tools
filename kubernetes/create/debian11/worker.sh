#!/bin/bash
export OS=Debian_11
export VERSION=1.27
export CIDR="10.85.0.0"
export CRI_SOCKET=unix:///var/run/crio/crio.sock

# 這裡設定 cluster 建立後拿到的 TOKEN, DISCOVERY_TOKEN
export MASTER_IP="192.168.56.150"
export TOKEN=""
export DISCOVERY_TOKEN=""

./00disable-swap.sh
./01prequirement.sh
./11crio.sh
./21kubetools.sh
./32join-worker.sh ${MASTER_IP} ${TOKEN} ${DISCOVERY_TOKEN}