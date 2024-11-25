
variable "region" {
  description = "vm region"
  type = string
}

variable "project_id" {
  description = "project id in gcp"
  type = string
}

variable "zone" {
  description = "vm zone"
  type = string
}

variable "machine_type" {
  description = "vm type"
  type = string
}

variable "image" {
  description = "image to run on vm"
  type = string
}

variable "network" {
  description = "external network type"
  type = string
}

variable "ssh_user" {
  description = "username:ssh"
  type = string
}

variable "instance_name" {
  description = "name of the vm"
  type = string
}