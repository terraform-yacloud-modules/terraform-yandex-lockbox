module "testsecret" {
  source = "../../"

  name        = "testsecret-password"
  description = "Тестовый секрет со сгенерированным паролем"
  labels = {
    environment = "test"
    project     = "demo"
  }

  deletion_protection = false
  kms_key_id          = null

  # The generated password is the only payload entry of the secret, so
  # entries and entries_with_command must not be set here.
  password_payload_specification = {
    password_key        = "generated-password"
    length              = 24
    include_digits      = true
    include_lowercase   = true
    include_uppercase   = true
    include_punctuation = false
  }

  timeouts = {
    create = "30m"
    read   = "30m"
    update = "15m"
    delete = "30m"
  }

}
