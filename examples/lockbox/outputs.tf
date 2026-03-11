output "id" {
  description = "Lockbox secret ID"
  value       = module.testsecret.id
}

output "name" {
  description = "Lockbox secret name"
  value       = module.testsecret.name
}

output "entries_map" {
  description = "Secret entries as a map"
  value       = module.testsecret.entries_map
  sensitive   = true
}
