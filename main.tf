data "yandex_client_config" "client" {}

resource "yandex_lockbox_secret" "main" {
  name        = var.name
  description = var.description
  folder_id   = coalesce(var.folder_id, data.yandex_client_config.client.folder_id)
  labels      = var.labels

  deletion_protection = var.deletion_protection
  kms_key_id          = var.kms_key_id

  dynamic "password_payload_specification" {
    for_each = var.password_payload_specification == null ? [] : [var.password_payload_specification]
    content {
      password_key         = password_payload_specification.value.password_key
      length               = try(password_payload_specification.value.length, null)
      include_digits       = try(password_payload_specification.value.include_digits, null)
      include_lowercase    = try(password_payload_specification.value.include_lowercase, null)
      include_uppercase    = try(password_payload_specification.value.include_uppercase, null)
      include_punctuation  = try(password_payload_specification.value.include_punctuation, null)
      included_punctuation = try(password_payload_specification.value.included_punctuation, null) != null ? try(password_payload_specification.value.included_punctuation, null) : null
      excluded_punctuation = try(password_payload_specification.value.included_punctuation, null) == null ? try(password_payload_specification.value.excluded_punctuation, null) : null
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = try(timeouts.value.create, null)
      read   = try(timeouts.value.read, null)
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

  dynamic "entries" {
    for_each = var.entries_with_command
    content {
      key = entries.value.key
      dynamic "command" {
        for_each = [entries.value.command]
        content {
          path = command.value.path
          args = try(command.value.args, null)
          env  = try(command.value.env, null)
        }
      }
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
