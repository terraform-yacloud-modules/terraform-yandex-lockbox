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
  description = "Timeout settings for cluster operations"
  type = object({
    create = optional(string)
    read   = optional(string)
    delete = optional(string)
  })
  default = null
}
