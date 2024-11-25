output "vault_project_id" {
  value = data.vault_generic_secret.gcp.data["project_id"]
}

output "vault_ssh_user" {
  value = data.vault_generic_secret.gcp.data["ssh_user"]
}