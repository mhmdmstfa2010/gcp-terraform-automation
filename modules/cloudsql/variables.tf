# CloudSQL Module - Variables

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

variable "sql_instances" {
  description = "List of CloudSQL instances to create"
  type = list(object({
    name             = string
    database_version = string
    tier             = string
  }))
}
