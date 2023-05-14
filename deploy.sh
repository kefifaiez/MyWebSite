#!/bin/bash

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# Download and install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
minikube start

# Build Docker image
docker build -t kefifaiez/mywebsite:latest ./mywebsite

# Push Docker image to Docker Hub
docker push kefifaiez/mywebsite:latest

# Create namespace
kubectl create namespace mywebsite

# Create deployment and service
kubectl apply -f ./mywebsite/deployment.yaml -n mywebsite

# Get service URL
service_ip=$(kubectl get service mywebsite-service -n mywebsite -o 'jsonpath={.status.loadBalancer.ingress[0].ip}')

# Display website URL
echo "Access your website at http://${service_ip}"
