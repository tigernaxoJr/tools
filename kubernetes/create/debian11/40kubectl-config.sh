#!/bin/bash
if [[ -n "${1}" ]]; then
  USER="${1}"
  CONFIG_DIR=/home/${USER}/.kube
else
  USER="$(id -u)"
  CONFIG_DIR=${HOME}/.kube
fi
if [[ -n "${2}" ]]; then
  GROUP="${1}"
else
  GROUP="$(id -u)"
fi
mkdir -p ${CONFIG_DIR}
cp -i /etc/kubernetes/admin.conf ${CONFIG_DIR}/config
chown ${USER}:${GROUP} ${CONFIG_DIR}/config