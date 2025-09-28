# GCP Terraform Project - Outputs

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_self_link" {
  description = "Self link of the VPC"
  value       = module.vpc.vpc_self_link
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = module.subnets.subnet_ids
}

output "subnet_self_links" {
  description = "Self links of the subnets"
  value       = module.subnets.subnet_self_links
}

output "firewall_rule_ids" {
  description = "IDs of the firewall rules"
  value       = module.firewall.firewall_rule_ids
}

output "service_account_emails" {
  description = "Email addresses of the service accounts"
  value       = module.service_accounts.service_account_emails
}

output "bucket_names" {
  description = "Names of the storage buckets"
  value       = module.storage.bucket_names
}

output "bucket_urls" {
  description = "URLs of the storage buckets"
  value       = module.storage.bucket_urls
}

output "instance_ids" {
  description = "IDs of the compute instances"
  value       = module.compute.instance_ids
}

output "instance_ips" {
  description = "IP addresses of the compute instances"
  value       = module.compute.instance_ips
}

output "sql_instance_ids" {
  description = "IDs of the CloudSQL instances"
  value       = module.cloudsql.sql_instance_ids
}

output "sql_instance_ips" {
  description = "IP addresses of the CloudSQL instances"
  value       = module.cloudsql.sql_instance_ips
}

output "gke_cluster_ids" {
  description = "IDs of the GKE clusters"
  value       = module.gke.gke_cluster_ids
}

output "gke_cluster_endpoints" {
  description = "Endpoints of the GKE clusters"
  value       = module.gke.gke_cluster_endpoints
}

output "dns_zone_names" {
  description = "Names of the DNS zones"
  value       = module.dns.dns_zone_names
}

output "load_balancer_ips" {
  description = "IP addresses of the load balancers"
  value       = module.loadbalancer.load_balancer_ips
}
