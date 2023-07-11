#!/bin/bash

# install docker
sudo apt update -y
sudo apt install -y docker.io
sudo apt update -y


# install git
sudo apt install git -y

# install terraform
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt update -y
sudo apt -y install terraform

