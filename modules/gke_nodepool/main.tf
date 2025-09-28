# GKE Node Pool Module - Main Configuration

resource "google_container_node_pool" "pools" {
  count = length(var.node_pools)

  name       = var.node_pools[count.index].name
  location   = var.region
  cluster    = var.gke_cluster_name
  node_count = var.node_pools[count.index].node_count

  project = var.project_id

  node_config {
    preemptible  = false
    machine_type = var.node_pools[count.index].machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "terraform-sa@${var.project_id}.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    # Enable workload identity
    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    # Enable shielded nodes
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }

    # Enable confidential nodes
    confidential_nodes {
      enabled = true
    }

    # Enable auto repair and auto upgrade
    management {
      auto_repair  = true
      auto_upgrade = true
    }

    # Enable autoscaling
    autoscaling {
      min_node_count = 1
      max_node_count = 10
    }

    # Enable spot instances for cost optimization
    spot = false

    # Disk configuration
    disk_size_gb = 20
    disk_type    = "pd-standard"

    # Image type
    image_type = "COS_CONTAINERD"

    # Labels
    labels = {
      environment = "production"
      team        = "platform"
    }

    # Taints
    taint {
      key    = "node.kubernetes.io/disk-pressure"
      value  = "true"
      effect = "NO_SCHEDULE"
    }
  }

  # Enable autoscaling
  autoscaling {
    min_node_count = 1
    max_node_count = 10
  }

  # Enable management
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  # Enable upgrade settings
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
}
