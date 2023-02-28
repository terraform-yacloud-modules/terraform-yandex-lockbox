output "id" {
  description = "Lockbox secret ID"
  value       = yandex_lockbox_secret.main.id
}

output "name" {
  description = "Lockbox secret name"
  value       = yandex_lockbox_secret.main.name
}
