#!/bin/bash

sudo apt update -y
sudo apt install -y git

# wip modules install
sudo mkdir /must_be_madness/what_is_pill
sudo cd /must_be_madness/what_is_pill
sudo git clone https://github.com/KNUT-Capstone-Design-team-1/wip-main-server-v2
sudo git clone https://github.com/KNUT-Capstone-Design-team-1/wip-deep-learning-server-v2

# Docker install
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo gpgconf --kill dirmngr
sudo chown -R $USER ~/.gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli [containerd.i](http://containerd.io/)o
sudo usermod -aG docker $USER

# Docker Compose install
sudo sudo apt install -y docker-compose-plugin