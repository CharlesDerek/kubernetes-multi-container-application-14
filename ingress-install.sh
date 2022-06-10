#!/bin/bash

greeting1="Hello! We noticed you have a"
greeting2="operating system"

unsupported="Unfortunately we do not support automated installers for this operation using your operating system at the current moment. We apologize for the inconvenience."

if [ "$(uname)" == "Darwin" ]; then
    echo "$greeting1 mac $greeting2"
    echo "$unsupported"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "$greeting1 linux $greeting2"
    # Install (Debian Based Distros):
    cd ~/Downloads
    mkdir kubectlInstall
    cd kubectlInstall
    sudo apt install -y curl
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install -y minikube-linux-amd64 /usr/local/bin/minikube
    sudo apt-get update -y
    #Starting Minikube and Testing Installation:
    # Add user to docker (if not done previously for Docker):
    sudo usermod -aG docker $USER && newgrp docker
    #   Log out of the user profile and log back in so these changes take effect. If running inside a VM, you will need to restart the entire machine, not just log out.
    minikube start
    echo "Minikube Installed"
    minikube status
    #3. Install kubectl:
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    kubectl version
    #4. Install ingress-nginx:
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml
    #The ingress controller can be installed through minikube's addons system:
    minikube addons enable ingress
    





    echo "Installation Successfully Completed"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo "$greeting1 windows $greeting2"
    echo "$unsupported"
    exit 1
fi
