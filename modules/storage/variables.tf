# Storage Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "buckets" {
  description = "List of storage buckets to create"
  type = list(object({
    name     = string
    location = string
  }))
}
