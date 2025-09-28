# GKE Node Pool Module - Outputs

output "node_pool_ids" {
  description = "IDs of the GKE node pools"
  value       = google_container_node_pool.pools[*].id
}

output "node_pool_names" {
  description = "Names of the GKE node pools"
  value       = google_container_node_pool.pools[*].name
}
