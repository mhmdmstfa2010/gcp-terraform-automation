# IAM Module - Main Configuration

resource "google_project_iam_binding" "bindings" {
  count = length(var.iam_bindings)

  project = var.project_id
  role    = var.iam_bindings[count.index].role

  members = var.iam_bindings[count.index].members
}
