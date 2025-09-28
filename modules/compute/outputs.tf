# Compute Module - Outputs

output "instance_ids" {
  description = "IDs of the compute instances"
  value       = google_compute_instance.instances[*].id
}

output "instance_ips" {
  description = "IP addresses of the compute instances"
  value       = google_compute_instance.instances[*].network_interface[0].access_config[0].nat_ip
}

output "instance_names" {
  description = "Names of the compute instances"
  value       = google_compute_instance.instances[*].name
}
