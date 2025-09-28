# Firewall Module - Main Configuration

resource "google_compute_firewall" "rules" {
  count = length(var.firewall_rules)

  name    = var.firewall_rules[count.index].name
  network = var.vpc_name

  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = var.firewall_rules[count.index].ports
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-${var.firewall_rules[count.index].name}"]
}

# Default deny all ingress rule
resource "google_compute_firewall" "deny_all_ingress" {
  name    = "${var.vpc_name}-deny-all-ingress"
  network = var.vpc_name

  project = var.project_id

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 65534
}

# Allow all egress
resource "google_compute_firewall" "allow_all_egress" {
  name    = "${var.vpc_name}-allow-all-egress"
  network = var.vpc_name

  project = var.project_id

  allow {
    protocol = "all"
  }

  direction = "EGRESS"
  priority  = 65534
}
