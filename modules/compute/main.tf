# Compute Module - Main Configuration

# Get the latest Ubuntu image
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2004-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "instances" {
  count = length(var.instances)

  name         = var.instances[count.index].name
  machine_type = var.instances[count.index].machine_type
  zone         = var.instances[count.index].zone

  project = var.project_id

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF

  tags = ["allow-ssh", "allow-http"]

  service_account {
    email  = "terraform-sa@${var.project_id}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
