#!/bin/bash
echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list
apt-get update
apt-get install -y -t buster-backports libseccomp2 || apt-get update -y -t buster-backports libseccomp2
apt-get install -y gnupg gnupg2 curl apt-transport-https ca-certificates 