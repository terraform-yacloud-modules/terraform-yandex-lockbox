module "testsecret" {
  source = "../../"

  name        = "testsecret"
  description = "Тестовый секрет для демонстрации возможностей модуля"
  labels = {
    environment = "test"
    project     = "demo"
  }

  entries = {
    "key-a" : "value-a"
    "key-pem" : file("key.pem")
    "api-key" : "my-super-secret-api-key-12345"
  }

  deletion_protection = false
  kms_key_id          = null

  password_payload_specification = {
    password_key        = "generated-password"
    length              = 24
    include_digits      = true
    include_lowercase   = true
    include_uppercase   = true
    include_punctuation = false
  }

  entries_with_command = [
    {
      key = "database-url"
      command = {
        path = "echo"
        args = ["postgresql://user:pass@localhost:5432/db"]
      }
    },
    {
      key = "current-timestamp"
      command = {
        path = "date"
        args = ["+%Y-%m-%dT%H:%M:%S"]
      }
    }
  ]

  timeouts = {
    create = "30m"
    read   = "30m"
    update = "15m"
    delete = "30m"
  }

}
