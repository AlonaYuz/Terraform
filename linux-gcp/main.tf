terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}

locals {
  instance_name = "new-vm"
}

module "local_vault_module" {
  source         = "./modules/local-vault"
  vault_address  = var.vault_address
  vault_secret_path  = var.vault_secret_path
}

module "linux_vm_gcp_module" {
  source         = "./modules/linux-vm-gcp"
  instance_name  = local.instance_name
  zone           = var.zone
  image          = var.image
  network        = var.network
  region = var.region
  ssh_user =  module.local_vault_module.vault_ssh_user
  machine_type = var.machine_type
  project_id =  module.local_vault_module.vault_project_id
}