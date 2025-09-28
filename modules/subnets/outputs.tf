# Subnets Module - Outputs

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = google_compute_subnetwork.subnets[*].id
}

output "subnet_self_links" {
  description = "Self links of the subnets"
  value       = google_compute_subnetwork.subnets[*].self_link
}

output "subnet_names" {
  description = "Names of the subnets"
  value       = google_compute_subnetwork.subnets[*].name
}
