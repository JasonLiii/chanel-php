#!/bin/bash
DOCKER_REGISTRY="docker-repo.ifalo.com.tw"

# is root?
if [ "`whoami`" != "root" ]; then
    echo "You may use root permission!"
    exit 1
fi

# install Docker
wget -qO- https://get.docker.com/gpg | sudo apt-key add -
wget -qO- https://get.docker.com/ | sh

# add user vagrant into group docker
usermod -aG docker vagrant

# install Docker Compose
curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# install Rancher Compose
curl -L https://github.com/rancher/rancher-compose/releases/download/v0.6.2/rancher-compose-linux-amd64-v0.6.2.tar.gz > /opt/rancher-compose.tar.gz
tar zxf /opt/rancher-compose.tar.gz && mv rancher-compose-v0.6.2/rancher-compose /usr/local/bin/rancher-compose && rm -Rf rancher-compose-v0.6.2 /opt/rancher-compose.tar.gz

# add registry host
echo "DOCKER_OPTS=\"--insecure-registry $DOCKER_REGISTRY\"" >> /etc/default/docker
service docker restart