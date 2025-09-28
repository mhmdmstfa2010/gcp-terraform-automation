# DNS Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "dns_zones" {
  description = "List of DNS zones to create"
  type = list(object({
    name   = string
    domain = string
  }))
}
