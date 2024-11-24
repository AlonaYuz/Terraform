
variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-b"
}

variable "machine_type" {
  default = "f1-micro"
}

variable "image" {
  default = "ubuntu-2004-focal-v20241016"
}

variable "vault_address" {
  default = "http://127.0.0.1:8200"
}