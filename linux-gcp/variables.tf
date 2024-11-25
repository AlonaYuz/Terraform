
variable "region" {
  default = "us-central1"
  description = "vm region"
  type = string
}

variable "zone" {
  default = "us-central1-b"
  description = "vm zone"
  type = string
}

variable "machine_type" {
  default = "f1-micro"
  description = "vm type"
  type = string
}

variable "image" {
  default = "ubuntu-2004-focal-v20241016"
  description = "image to run on vm"
  type = string
}

variable "vault_address" {
  default = "http://127.0.0.1:8200"
  description = "address to local vault running on computer"
  type = string
}

variable "vault_secret_path" {
  default = "terraform/data/gcp"
  description = "path to where secrets are mounted"
  type = string
}

variable "network" {
  default = "default"
  description = "external network type"
  type = string
}