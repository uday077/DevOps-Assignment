output "namespace" {
  description = "The namespace where WordPress is deployed"
  value       = kubernetes_namespace.wordpress_namespace.metadata[0].name
}

output "release_name" {
  description = "The Helm release name"
  value       = helm_release.wordpress.name
}

output "release_status" {
  description = "The status of the Helm release"
  value       = helm_release.wordpress.status
}

output "wordpress_url" {
  description = "URL to access WordPress"
  value       = "http://localhost:${var.wordpress_node_port}"
}

output "wordpress_url_minikube" {
  description = "URL to access WordPress (Minikube)"
  value       = "Use: minikube service ${var.release_name}-my-wordpress-chart-wordpress -n ${var.namespace} --url"
}

output "mysql_connection_info" {
  description = "MySQL connection information"
  value = {
    host     = "${var.release_name}-my-wordpress-chart-mysql.${var.namespace}.svc.cluster.local"
    port     = 3306
    database = var.mysql_database_name
    user     = var.mysql_database_user
  }
  sensitive = false
}

output "kubectl_get_pods" {
  description = "Command to check pods"
  value       = "kubectl get pods -n ${var.namespace}"
}

output "kubectl_get_services" {
  description = "Command to check services"
  value       = "kubectl get svc -n ${var.namespace}"
}
