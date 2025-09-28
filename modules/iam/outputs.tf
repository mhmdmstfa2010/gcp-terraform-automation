# IAM Module - Outputs

output "iam_binding_roles" {
  description = "Roles that have been bound"
  value       = google_project_iam_binding.bindings[*].role
}
