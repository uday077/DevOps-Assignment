# Kubernetes Configuration
kube_context = "minikube"  # or "docker-desktop"
namespace    = "wordpress-app"
release_name = "my-wordpress-release"

# MySQL Configuration
mysql_database_name     = "wordpress_db"
mysql_database_user     = "wordpress_user"
mysql_database_password = "SecurePass123!"
mysql_root_password     = "RootPass456!"
mysql_replica_count     = 1

# WordPress Configuration
wordpress_replica_count  = 2
wordpress_service_type   = "NodePort"
wordpress_node_port      = 30081
