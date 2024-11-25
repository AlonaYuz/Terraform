provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  # Specify the boot disk
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  # Network configuration
  network_interface {
    network = var.network

    access_config {
      # Ephemeral public IP
    }
  }

  # Metadata
  metadata = {
    ssh-keys = var.ssh_user
  }

  tags = ["http-server", "https-server"]
}