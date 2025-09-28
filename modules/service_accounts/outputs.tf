# Service Accounts Module - Outputs

output "service_account_emails" {
  description = "Email addresses of the service accounts"
  value       = google_service_account.accounts[*].email
}

output "service_account_ids" {
  description = "IDs of the service accounts"
  value       = google_service_account.accounts[*].id
}
