module "kms_key" {
  source = "../../"

  name   = "testsecret"
  labels = {}

  entries = {
    "key-a" : "value-a"
    "key-b" : "value-b"
  }

  deletion_protection = false
#   folder_id           = "xxx"
}
