terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "vault" {
  address = var.vault_address
}

data "vault_generic_secret" "gcp" {
  path = "terraform/data/gcp"
}

locals {
  project_id = data.vault_generic_secret.gcp.data["project_id"]
  ssh_user   = data.vault_generic_secret.gcp.data["ssh_user"]
}

provider "google" {
  project = local.project_id
  region  = var.region
  zone    = var.zone
}

# Define the VM instance
resource "google_compute_instance" "vm_instance" {
  name         = "linux-f1-micro-instance"
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
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }

  # Metadata
  metadata = {
    ssh-keys = data.vault_generic_secret.gcp.data["ssh_user"]
  }

  tags = ["http-server", "https-server"]
}
