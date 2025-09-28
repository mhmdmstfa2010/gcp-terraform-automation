# DNS Module - Main Configuration

resource "google_dns_managed_zone" "zones" {
  count = length(var.dns_zones)

  name        = var.dns_zones[count.index].name
  dns_name    = "${var.dns_zones[count.index].domain}."
  description = "Managed DNS zone for ${var.dns_zones[count.index].domain}"

  project = var.project_id

  visibility = "public"

  dnssec_config {
    state = "on"
    default_key_specs {
      algorithm  = "rsasha256"
      key_type   = "keySigning"
      key_length = 2048
    }
    default_key_specs {
      algorithm  = "rsasha256"
      key_type   = "zoneSigning"
      key_length = 1024
    }
  }
}

# Create A records for the zones
resource "google_dns_record_set" "a_records" {
  count = length(var.dns_zones)

  name = "${var.dns_zones[count.index].domain}."
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.zones[count.index].name

  project = var.project_id

  rrdatas = ["8.8.8.8"]
}

# Create CNAME records
resource "google_dns_record_set" "cname_records" {
  count = length(var.dns_zones)

  name = "www.${var.dns_zones[count.index].domain}."
  type = "CNAME"
  ttl  = 300

  managed_zone = google_dns_managed_zone.zones[count.index].name

  project = var.project_id

  rrdatas = [var.dns_zones[count.index].domain]
}
