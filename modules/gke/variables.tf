# GKE Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "gke_clusters" {
  description = "List of GKE clusters to create"
  type = list(object({
    name       = string
    node_count = number
  }))
}
