output "ENVIRONMENT_VARIABLES" {
  description = "Environment variables to access Vault and PostgreSQL containers"
  value       = <<EOF
   export VAULT_ADDR=http://127.0.0.1:8200 \
   VAULT_TOKEN=root
EOF
}