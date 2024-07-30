resource "yandex_lockbox_secret" "main" {
  name        = var.name
  description = var.description
  folder_id   = var.folder_id
  labels      = var.labels

  deletion_protection = var.deletion_protection
  kms_key_id          = var.kms_key_id
}

resource "yandex_lockbox_secret_version" "main" {
  secret_id   = yandex_lockbox_secret.main.id
  description = var.description

  dynamic "entries" {
    for_each = var.entries
    content {
      key        = entries.key
      text_value = entries.value
    }
  }
}
