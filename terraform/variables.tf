variable "kube_context" {
  description = "Kubernetes context to use from kubeconfig"
  type        = string
  default     = "minikube"  # Change to "docker-desktop" if using Docker Desktop
}

variable "namespace" {
  description = "Kubernetes namespace for WordPress application"
  type        = string
  default     = "wordpress-app"
}

variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "my-wordpress-release"
}

variable "chart_path" {
  description = "Path to the Helm chart"
  type        = string
  default     = "../my-wordpress-chart"
}

# MySQL Variables
variable "mysql_database_name" {
  description = "MySQL database name for WordPress"
  type        = string
  default     = "wordpress_db"
}

variable "mysql_database_user" {
  description = "MySQL database user for WordPress"
  type        = string
  default     = "wordpress_user"
}

variable "mysql_database_password" {
  description = "MySQL database password for WordPress user"
  type        = string
  sensitive   = true
  default     = "wordpress_password_123"
}

variable "mysql_root_password" {
  description = "MySQL root password"
  type        = string
  sensitive   = true
  default     = "mysql_root_password_456"
}

variable "mysql_replica_count" {
  description = "Number of MySQL replicas"
  type        = number
  default     = 1
}

# WordPress Variables
variable "wordpress_replica_count" {
  description = "Number of WordPress replicas"
  type        = number
  default     = 2
}

variable "wordpress_service_type" {
  description = "Kubernetes service type for WordPress"
  type        = string
  default     = "NodePort"
}

variable "wordpress_node_port" {
  description = "NodePort for WordPress external access"
  type        = number
  default     = 30081
}
