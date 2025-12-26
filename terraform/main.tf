terraform {
  required_version = ">= 1.0"
  
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.24"
    }
  }
}

# Configure Kubernetes provider to use local kubeconfig
provider "kubernetes" {
  config_path    = pathexpand("~/.kube/config")
  config_context = var.kube_context
}

# Configure Helm provider to use local kubeconfig
provider "helm" {
  kubernetes {
    config_path    = pathexpand("~/.kube/config")
    config_context = var.kube_context
  }
}

# Create a namespace for WordPress application
resource "kubernetes_namespace" "wordpress_namespace" {
  metadata {
    name = var.namespace
    labels = {
      name        = var.namespace
      environment = "local"
      managed-by  = "terraform"
      project     = "wordpress-mysql"
    }
  }
}

# Deploy WordPress + MySQL using Helm chart
resource "helm_release" "wordpress" {
  name       = var.release_name
  chart      = var.chart_path
  namespace  = kubernetes_namespace.wordpress_namespace.metadata[0].name
  
  # Wait for resources to be ready
  wait          = true
  timeout       = 600
  wait_for_jobs = true

  # MySQL Configuration Overrides
  set {
    name  = "mysql.database.name"
    value = var.mysql_database_name
  }

  set {
    name  = "mysql.database.user"
    value = var.mysql_database_user
  }

  set_sensitive {
    name  = "mysql.database.password"
    value = var.mysql_database_password
  }

  set_sensitive {
    name  = "mysql.database.rootPassword"
    value = var.mysql_root_password
  }

  set {
    name  = "mysql.replicaCount"
    value = var.mysql_replica_count
  }

  # WordPress Configuration Overrides
  set {
    name  = "wordpress.replicaCount"
    value = var.wordpress_replica_count
  }

  set {
    name  = "wordpress.service.type"
    value = var.wordpress_service_type
  }

  set {
    name  = "wordpress.service.nodePort"
    value = var.wordpress_node_port
  }

  # Force update on changes
  force_update  = true
  recreate_pods = false

  depends_on = [kubernetes_namespace.wordpress_namespace]
}
