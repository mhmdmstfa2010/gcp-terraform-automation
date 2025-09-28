# Storage Module - Outputs

output "bucket_names" {
  description = "Names of the storage buckets"
  value       = google_storage_bucket.buckets[*].name
}

output "bucket_urls" {
  description = "URLs of the storage buckets"
  value       = google_storage_bucket.buckets[*].url
}

output "bucket_ids" {
  description = "IDs of the storage buckets"
  value       = google_storage_bucket.buckets[*].id
}
