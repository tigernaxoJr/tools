#!/bin/bash
# $1 ip
# $2 token
# $3 discovery-token
kubeadm join ${1} --token ${2} --discovery-token-ca-cert-hash ${3}