module "testsecret" {
  source = "../../"

  name   = "testsecret"
  labels = {}

  entries = {
    "key-a" : "value-a"
    "key-b" : file("key.pem")
  }

  deletion_protection = false
}
