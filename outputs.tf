output "id" {
  description = "Lockbox secret ID"
  value       = yandex_lockbox_secret.main.id
}

output "name" {
  description = "Lockbox secret name"
  value       = yandex_lockbox_secret.main.name
}

output "folder_id" {
  description = "Folder ID where the secret is stored"
  value       = yandex_lockbox_secret.main.folder_id
}

output "created_at" {
  description = "Secret creation timestamp"
  value       = yandex_lockbox_secret.main.created_at
}

output "status" {
  description = "Secret status"
  value       = yandex_lockbox_secret.main.status
}

output "version_id" {
  description = "Lockbox version id"
  value       = yandex_lockbox_secret_version.main.id
}

output "entries" {
  description = "List of entries in the secret version (each with key and text_value)"
  value       = data.yandex_lockbox_secret_version.main.entries
  sensitive   = true
}

output "entries_map" {
  description = "Map of secret entry keys to their text values for easy lookups"
  value       = { for entry in data.yandex_lockbox_secret_version.main.entries : entry.key => entry.text_value }
  sensitive   = true
}
