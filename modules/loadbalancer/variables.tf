# Load Balancer Module - Variables

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

variable "load_balancers" {
  description = "List of load balancers to create"
  type = list(object({
    name = string
    type = string
  }))
}
