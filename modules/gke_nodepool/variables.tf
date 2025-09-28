# GKE Node Pool Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_pools" {
  description = "List of GKE node pools to create"
  type = list(object({
    name         = string
    node_count   = number
    machine_type = string
  }))
}
