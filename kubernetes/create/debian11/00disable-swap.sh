#!/bin/bash
sed -i '/ swap / s/^/#/' /etc/fstab
swapoff -a