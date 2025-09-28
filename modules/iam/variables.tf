# IAM Module - Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "iam_bindings" {
  description = "List of IAM bindings"
  type = list(object({
    role    = string
    members = list(string)
  }))
}
