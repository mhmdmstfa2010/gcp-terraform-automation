# Storage Module - Main Configuration

resource "google_storage_bucket" "buckets" {
  count = length(var.buckets)

  name          = var.buckets[count.index].name
  location      = var.buckets[count.index].location
  force_destroy = false

  project = var.project_id

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 7
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }
}

# Make buckets private by default
resource "google_storage_bucket_iam_binding" "private" {
  count = length(var.buckets)

  bucket = google_storage_bucket.buckets[count.index].name
  role   = "roles/storage.objectViewer"

  members = [
    "projectEditor:${var.project_id}",
    "projectOwner:${var.project_id}",
  ]
}
