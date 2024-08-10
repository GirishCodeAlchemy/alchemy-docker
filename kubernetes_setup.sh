sudo apt-get update
sudo apt-get -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list 


sudo apt-get update
sudo apt-get -y install kubelet kubeadm kubectl kubernetes-cni
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a

#sudo hostnamectl set-hostname kubernetes-master    # set hostname
#
#sudo vim /etc/sysctl.conf
#net.bridge.bridge-nf-call-iptables=1
#
#
#
#cat <<EOF | sudo tee /etc/docker/daemon.json
#{ "exec-opts": ["native.cgroupdriver=systemd"],
#"log-driver": "json-file",
#"log-opts":
#{ "max-size": "100m" },
#"storage-driver": "overlay2"
#}
#EOF
#
#sudo systemctl daemon-reload
#sudo systemctl restart docker
#
#sudo kubeadm init --pod-network-cidr=10.244.0.0/16
#
#kubectl taint nodes --all node-role.kubernetes.io/master-     # to remove for single node
#
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml