# Firewall Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "firewall_rules" {
  description = "List of firewall rules"
  type = list(object({
    name  = string
    ports = list(string)
  }))
}
