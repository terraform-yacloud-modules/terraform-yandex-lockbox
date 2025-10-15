resource "yandex_lockbox_secret" "main" {
  name        = var.name
  description = var.description
  folder_id   = var.folder_id
  labels      = var.labels

  deletion_protection = var.deletion_protection
  kms_key_id          = var.kms_key_id

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = try(timeouts.value.create, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }

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

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = try(timeouts.value.create, null)
      read   = try(timeouts.value.read, null)
      delete = try(timeouts.value.delete, null)
    }
  }
  
}
