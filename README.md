# WordPress + MySQL Deployment with Helm and Terraform

Local Kubernetes (Minikube/Docker Desktop) par WordPress aur MySQL deploy karne ka complete solution.

## Prerequisites
- Minikube ya Docker Desktop
- Helm 3.x
- Terraform 1.0+
- kubectl

## Quick Start

1. Minikube start karein:
```bash
   minikube start --driver=docker --cpus=4 --memory=6144
```

2. Terraform initialize karein:
```bash
   cd terraform
   terraform init
```

3. Deploy karein:
```bash
   terraform apply
```

4. WordPress access karein:
```bash
   minikube service my-wordpress-release-my-wordpress-chart-wordpress -n wordpress-app
```

## Cleanup
```bash
terraform destroy
```
EOF
