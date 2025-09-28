# GKE Module - Outputs

output "gke_cluster_ids" {
  description = "IDs of the GKE clusters"
  value       = google_container_cluster.clusters[*].id
}

output "gke_cluster_endpoints" {
  description = "Endpoints of the GKE clusters"
  value       = google_container_cluster.clusters[*].endpoint
}

output "gke_cluster_names" {
  description = "Names of the GKE clusters"
  value       = google_container_cluster.clusters[*].name
}
