#!/bin/bash
echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list
apt update
apt install -y -t buster-backports libseccomp2 || apt update -y -t buster-backports libseccomp2
apt install -y gnupg gnupg2 curl apt-transport-https ca-certificates 