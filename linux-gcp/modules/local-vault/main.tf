provider "vault" {
  address = var.vault_address
}

data "vault_generic_secret" "gcp" {
  path = var.vault_secret_path
}