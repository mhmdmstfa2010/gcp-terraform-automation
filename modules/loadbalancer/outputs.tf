# Load Balancer Module - Outputs

output "load_balancer_ips" {
  description = "IP addresses of the load balancers"
  value       = google_compute_global_address.lb_ip[*].address
}

output "load_balancer_names" {
  description = "Names of the load balancers"
  value       = google_compute_global_forwarding_rule.lb_forwarding_rule[*].name
}

output "load_balancer_urls" {
  description = "URLs of the load balancers"
  value       = google_compute_global_forwarding_rule.lb_forwarding_rule[*].name
}
