#!/bin/sh

#Install docker
wget -qO- https://get.docker.com/ | sh
#Set up to run docker as user
sudo usermod -aG docker $(whoami)
#Install docker-compose
sudo apt-get install jq
sudo apt-get remove docker-compose
COMPOSE_VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# set max map for elasticsearch
sudo sysctl -w vm.max_map_count=262144
sudo sh -c 'echo "vm.max_map_count=262144" >> /etc/sysctl.conf'
sudo sh -c 'echo DOCKER_OPTS=\"--storage-driver=overlay\" >> /etc/default/docker'
export DOCKER_HOST=127.0.0.1