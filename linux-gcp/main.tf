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

locals {
  instance_name = "new-vm"
}

provider "google" {
  project = local.project_id
  region  = var.region
  zone    = var.zone
}

module "linux_vm_gcp_module" {
  source         = "./modules/linux-vm-gcp"  # Path to the module directory
  instance_name  = local.instance_name
  instance_type  = var.machine_type
  zone           = var.zone
  image          = var.image
  network        = var.network
}