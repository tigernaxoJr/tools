#!/bin/bash
# Creating a cluster with kubeadm
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

kubeadm init --pod-network-cidr=${CIDR}/16 --cri-socket=${CRI_SOCKET}

KUBECONFIG=/etc/kubernetes/admin.conf

curl -sL https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml | \
    sed 's/10\.244\.0\.0/$CIDR/g' > /tmp/flannel.yml

kubectl apply -f /tmp/flannel.yml