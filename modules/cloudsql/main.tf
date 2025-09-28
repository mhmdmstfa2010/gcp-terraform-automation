# CloudSQL Module - Main Configuration

resource "google_sql_database_instance" "instances" {
  count = length(var.sql_instances)

  name             = var.sql_instances[count.index].name
  database_version = var.sql_instances[count.index].database_version
  region           = var.region

  project = var.project_id

  settings {
    tier = var.sql_instances[count.index].tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_name
      require_ssl     = true
    }

    backup_configuration {
      enabled                        = true
      start_time                     = "03:00"
      location                       = var.region
      point_in_time_recovery_enabled = true
    }

    maintenance_window {
      day          = 7
      hour         = 3
      update_track = "stable"
    }

    disk_autoresize = true
    disk_size       = 20
    disk_type       = "PD_SSD"
  }

  deletion_protection = false
}

resource "google_sql_database" "databases" {
  count = length(var.sql_instances)

  name     = "${var.sql_instances[count.index].name}-db"
  instance = google_sql_database_instance.instances[count.index].name

  project = var.project_id
}

resource "google_sql_user" "users" {
  count = length(var.sql_instances)

  name     = "dbuser"
  instance = google_sql_database_instance.instances[count.index].name
  password = "secure-password-123"

  project = var.project_id
}
