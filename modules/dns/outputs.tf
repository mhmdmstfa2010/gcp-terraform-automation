# DNS Module - Outputs

output "dns_zone_names" {
  description = "Names of the DNS zones"
  value       = google_dns_managed_zone.zones[*].name
}

output "dns_zone_domains" {
  description = "Domains of the DNS zones"
  value       = google_dns_managed_zone.zones[*].dns_name
}

output "name_servers" {
  description = "Name servers for the DNS zones"
  value       = google_dns_managed_zone.zones[*].name_servers
}
