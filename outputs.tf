output "id" {
  description = "Lockbox secret ID"
  value       = yandex_lockbox_secret.main.id
}

output "name" {
  description = "Lockbox secret name"
  value       = yandex_lockbox_secret.main.name
}

output "version_id" {
  description = "Lockbox version id"
  value       = yandex_lockbox_secret_version.main.id
}
