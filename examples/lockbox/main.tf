module "testsecret" {
  source = "../../"

  name   = "testsecret"
  labels = {}

  entries = {
    "key-a" : "value-a"
    "key-pem" : file("key.pem")
  }

  deletion_protection = false


  timeouts = {
    create = "30m"
    read   = "30m"
    delete = "30m"
  }

}
