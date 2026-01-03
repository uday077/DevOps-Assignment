# WordPress Deployment using Terraform, Helm, and Minikube (Windows)

This project automates the deployment of a WordPress application connected to a MySQL database on a local Kubernetes cluster. It utilizes **Terraform** for orchestration and a custom **Helm Chart** for defining Kubernetes resources.

**Note:** This project is configured for a Windows environment using local binaries for Helm and Minikube.

## 📂 Project Structure

```text
wordpress-helm-terraform/
├── terraform/                # Terraform configuration files
│   ├── main.tf               # Main execution logic
│   ├── variables.tf          # Variable definitions
│   ├── outputs.tf            # Output definitions
│   ├── terraform.tfvars      # Variable values
│   ├── helm.exe              # (You must download and place this here)
│   └── minikube.exe          # (You must download and place this here)
└── my-wordpress-chart/       # Custom Helm Chart
    ├── Chart.yaml
    ├── values.yaml
    └── templates/
        ├── mysql-deployment.yaml
        ├── mysql-service.yaml
        ├── wordpress-deployment.yaml
        └── wordpress-service.yaml
EOf

🛠️ Prerequisites
Since .exe files are not uploaded to GitHub, you must set them up manually:

Docker Desktop: Ensure it is installed and running.

Minikube: Download minikube-windows-amd64.exe, rename it to minikube.exe, and place it inside the terraform/ folder.

Helm: Download helm-v4.0.4-windows-amd64.zip, extract it, copy helm.exe, and place it inside the terraform/ folder.

## 🏗️ Architecture Blueprint
![Project Architecture](./architecture-diagram.png)

## 🚀 How to Run the Project

Follow these steps to deploy the application on Windows:

### Step 1: Navigate to the Terraform Directory
Open your terminal (VS Code or PowerShell) and move to the folder where your files are located:

```powershell
cd terraform

Step 2: Start the Minikube Cluster
.\minikube.exe start --driver=docker

Step 3: Initialize Terraform
terraform init

Step 4: Deploy the Application
terraform plan
terraform apply --auto-approve

Step 5: Access the Website
.\minikube.exe service my-wordpress-release-my-wordpress-chart-wordpress -n wordpress-app

🛑 How to Stop/Delete
terraform destroy --auto-approve
.\minikube.exe stop
