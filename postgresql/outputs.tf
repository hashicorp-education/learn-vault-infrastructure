output "ENVIRONMENT_VARIABLES" {
  description = "Environment variables to access Vault and PostgreSQL containers"
  value       = <<EOF
   export TF_VAR_POSTGRES_URL=${docker_container.postgres.network_data.0.ip_address}:5432
EOF
}
