# Service Accounts Module - Main Configuration

resource "google_service_account" "accounts" {
  count = length(var.service_accounts)

  account_id   = var.service_accounts[count.index].account_id
  display_name = var.service_accounts[count.index].display_name
  description  = var.service_accounts[count.index].description

  project = var.project_id
}

# Grant basic roles to service accounts
resource "google_project_iam_member" "service_account_roles" {
  count = length(var.service_accounts)

  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.accounts[count.index].email}"
}
