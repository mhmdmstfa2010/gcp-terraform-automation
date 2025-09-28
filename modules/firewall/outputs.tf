# Firewall Module - Outputs

output "firewall_rule_ids" {
  description = "IDs of the firewall rules"
  value       = google_compute_firewall.rules[*].id
}

output "firewall_rule_names" {
  description = "Names of the firewall rules"
  value       = google_compute_firewall.rules[*].name
}
