# Service Accounts Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "service_accounts" {
  description = "List of service accounts to create"
  type = list(object({
    account_id   = string
    display_name = string
    description  = string
  }))
}
