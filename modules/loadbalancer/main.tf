# Load Balancer Module - Main Configuration

# Global IP address for load balancer
resource "google_compute_global_address" "lb_ip" {
  count = length(var.load_balancers)

  name = "${var.load_balancers[count.index].name}-ip"

  project = var.project_id
}

# Health check
resource "google_compute_health_check" "lb_health_check" {
  count = length(var.load_balancers)

  name = "${var.load_balancers[count.index].name}-health-check"

  project = var.project_id

  http_health_check {
    port         = 80
    request_path = "/"
  }

  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
}

# Backend service
resource "google_compute_backend_service" "lb_backend" {
  count = length(var.load_balancers)

  name        = "${var.load_balancers[count.index].name}-backend"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10

  project = var.project_id

  health_checks = [google_compute_health_check.lb_health_check[count.index].id]

  backend {
    group = google_compute_instance_group.lb_instances[count.index].id
  }

  enable_cdn = true

  cdn_policy {
    cache_mode        = "CACHE_ALL_STATIC"
    default_ttl       = 3600
    client_ttl        = 3600
    max_ttl           = 86400
    negative_caching  = true
    serve_while_stale = 86400
    cache_key_policy {
      include_host         = true
      include_protocol     = true
      include_query_string = true
    }
  }
}

# Instance group
resource "google_compute_instance_group" "lb_instances" {
  count = length(var.load_balancers)

  name = "${var.load_balancers[count.index].name}-instances"

  project = var.project_id

  instances = []

  named_port {
    name = "http"
    port = 80
  }

  zone = "${var.region}-a"
}

# URL map
resource "google_compute_url_map" "lb_url_map" {
  count = length(var.load_balancers)

  name            = "${var.load_balancers[count.index].name}-url-map"
  default_service = google_compute_backend_service.lb_backend[count.index].id

  project = var.project_id
}

# HTTP proxy
resource "google_compute_target_http_proxy" "lb_proxy" {
  count = length(var.load_balancers)

  name    = "${var.load_balancers[count.index].name}-proxy"
  url_map = google_compute_url_map.lb_url_map[count.index].id

  project = var.project_id
}

# Global forwarding rule
resource "google_compute_global_forwarding_rule" "lb_forwarding_rule" {
  count = length(var.load_balancers)

  name       = "${var.load_balancers[count.index].name}-forwarding-rule"
  target     = google_compute_target_http_proxy.lb_proxy[count.index].id
  port_range = "80"
  ip_address = google_compute_global_address.lb_ip[count.index].address

  project = var.project_id
}
