#!/bin/bash
SUDO_USER="naxo"
# todo ip table
sed -i 's/^deb cdrom/# deb cdrom/' /etc/apt/sources.list
chmod a+x ./*.sh
apt install -y vim git sudo 

usermod -aG sudo ${SUDO_USER}

./91static-ip.sh enp0s8 192.168.56.150
./master.sh

cat <<EOF | tee /tmp/demo.yml
apiVersion: v1
kind: Pod 
metadata:
  name: kubernetes-demo-pod
  labels:
    app: demoApp
spec:
  containers:
    - name: kubernetes-demo-container
      image: hcwxd/kubernetes-demo
      ports:
        - containerPort: 3000
EOF

cat <<EOF | tee /tmp/serv.yml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: demoApp
  type: NodePort
  ports:
    - protocol: TCP 
      port: 3001
      targetPort: 3000
      nodePort: 30390
EOF

kubectl apply -f /tmp/demo.yml
kubectl apply -f /tmp/serv.yml