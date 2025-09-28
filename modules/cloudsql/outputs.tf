# CloudSQL Module - Outputs

output "sql_instance_ids" {
  description = "IDs of the CloudSQL instances"
  value       = google_sql_database_instance.instances[*].id
}

output "sql_instance_ips" {
  description = "IP addresses of the CloudSQL instances"
  value       = google_sql_database_instance.instances[*].private_ip_address
}

output "sql_instance_names" {
  description = "Names of the CloudSQL instances"
  value       = google_sql_database_instance.instances[*].name
}
