#!/bin/bash
set -xe

echo "START" > /home/ubuntu/setup.log

sudo apt-get update -y

sudo apt install -y docker.io

sudo apt-get install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo sudo apt install docker-compose-plugin -y

usermod -aG docker ubuntu

echo "DOCKER INSTALLED" >> /home/ubuntu/setup.log