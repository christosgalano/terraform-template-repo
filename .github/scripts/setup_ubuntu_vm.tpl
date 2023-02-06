#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl lsb-release gnupg-agent software-properties-common
curl -fsSL https://get.docker.com -o get-docker.sh && sudo chmod +x get-docker.sh && ./get-docker.sh && sudo usermod -aG docker $USER
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update -y
sudo apt-get install azure-cli -y
sudo az aks install-cli
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash