# GCP Terraform Project - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "firewall_rules" {
  description = "List of firewall rules"
  type = list(object({
    name  = string
    ports = list(string)
  }))
}

variable "iam_bindings" {
  description = "List of IAM bindings"
  type = list(object({
    role    = string
    members = list(string)
  }))
  default = []
}

variable "service_accounts" {
  description = "List of service accounts to create"
  type = list(object({
    account_id   = string
    display_name = string
    description  = string
  }))
  default = []
}

variable "buckets" {
  description = "List of storage buckets to create"
  type = list(object({
    name     = string
    location = string
  }))
  default = []
}

variable "instances" {
  description = "List of compute instances to create"
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
  }))
  default = []
}

variable "sql_instances" {
  description = "List of CloudSQL instances to create"
  type = list(object({
    name             = string
    database_version = string
    tier             = string
  }))
  default = []
}

variable "gke_clusters" {
  description = "List of GKE clusters to create"
  type = list(object({
    name       = string
    node_count = number
  }))
  default = []
}

variable "node_pools" {
  description = "List of GKE node pools to create"
  type = list(object({
    name         = string
    node_count   = number
    machine_type = string
  }))
  default = []
}

variable "dns_zones" {
  description = "List of DNS zones to create"
  type = list(object({
    name   = string
    domain = string
  }))
  default = []
}

variable "load_balancers" {
  description = "List of load balancers to create"
  type = list(object({
    name = string
    type = string
  }))
  default = []
}
