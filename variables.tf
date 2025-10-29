#
# yandex cloud coordinates
#
variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = null
  validation {
    condition     = var.folder_id == null || can(regex("^[a-zA-Z0-9-_]+$", var.folder_id))
    error_message = "Folder ID must be a valid Yandex Cloud folder identifier or null."
  }
}

#
# naming
#
variable "name" {
  description = "Lockbox secret name"
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9-_]{1,61}[a-zA-Z0-9]$", var.name))
    error_message = "Name must be 3-63 characters long, start and end with alphanumeric character, and can contain letters, numbers, hyphens, and underscores."
  }
}

variable "description" {
  description = "Lockbox secret description"
  type        = string
  default     = ""
  validation {
    condition     = length(var.description) <= 256
    error_message = "Description cannot exceed 256 characters."
  }
}

variable "labels" {
  description = "A set of labels"
  type        = map(string)
  default     = {}
}

#
# secret configuration
#
variable "entries" {
  description = "List of secret entries"
  type        = map(string)
  default     = {}
  validation {
    condition     = alltrue([for k, v in var.entries : can(regex("^[a-zA-Z0-9-_]+$", k))])
    error_message = "Entry keys must contain only alphanumeric characters, hyphens, and underscores."
  }
}

variable "deletion_protection" {
  description = "Whether the lockbox secret is protected from deletion"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "KMS key used to encrypt the lockbox secret"
  type        = string
  default     = null
  validation {
    condition     = var.kms_key_id == null || can(regex("^[a-zA-Z0-9-_]+$", var.kms_key_id))
    error_message = "KMS key ID must be a valid Yandex Cloud KMS key identifier or null."
  }
}

variable "timeouts" {
  description = "Timeout settings for lockbox secret operations"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

#
# password generation specification
#
variable "password_payload_specification" {
  description = "Password generation specification for lockbox secret"
  type = object({
    password_key         = string
    length               = optional(number, 36)
    include_digits       = optional(bool, true)
    include_lowercase    = optional(bool, true)
    include_uppercase    = optional(bool, true)
    include_punctuation  = optional(bool, true)
    included_punctuation = optional(string, "")
    excluded_punctuation = optional(string, "")
  })
  default = null
  validation {
    condition = var.password_payload_specification == null || (
      var.password_payload_specification.length >= 8 &&
      var.password_payload_specification.length <= 128 &&
      can(regex("^[a-zA-Z0-9-_]+$", var.password_payload_specification.password_key)) &&
      (var.password_payload_specification.include_digits ||
        var.password_payload_specification.include_lowercase ||
        var.password_payload_specification.include_uppercase ||
      var.password_payload_specification.include_punctuation)
    )
    error_message = "Password specification must have length between 8-128, valid password key, and at least one character type enabled."
  }
}

#
# command-based entries
#
variable "entries_with_command" {
  description = "List of secret entries with command generation"
  type = list(object({
    key = string
    command = object({
      path = string
      args = optional(list(string), [])
      env  = optional(map(string), {})
    })
  }))
  default = []
  validation {
    condition = alltrue([
      for entry in var.entries_with_command : (
        can(regex("^[a-zA-Z0-9-_]+$", entry.key)) &&
        entry.command.path != "" &&
        !contains(["rm", "shutdown", "reboot", "halt", "poweroff"], basename(entry.command.path))
      )
    ])
    error_message = "Command entries must have valid keys and safe command paths (cannot use destructive system commands)."
  }
}
