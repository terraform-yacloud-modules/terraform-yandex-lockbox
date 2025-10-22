#
# yandex cloud coordinates
#
variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = null
}

#
# naming
#
variable "name" {
  description = "Lockbox secret name"
  type        = string
}

variable "description" {
  description = "Lockbox secret description"
  type        = string
  default     = ""
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
}
