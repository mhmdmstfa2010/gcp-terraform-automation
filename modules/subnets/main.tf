# Subnets Module - Main Configuration

resource "google_compute_subnetwork" "subnets" {
  count = length(var.subnets)

  name          = var.subnets[count.index].name
  ip_cidr_range = var.subnets[count.index].cidr
  region        = var.region
  network       = var.vpc_name

  project = var.project_id

  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
