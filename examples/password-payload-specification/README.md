# Yandex Cloud Lockbox Terraform module: password payload specification

This example creates a secret with a generated password. The password is the
only payload entry, so `entries` and `entries_with_command` are not set: the
Yandex Cloud provider ignores payload entries for secrets with a payload
specification.

## Usage

To run this example you need to execute:

```bash
export YC_FOLDER_ID='folder_id'
terraform init
terraform plan
terraform apply
```

Fetch the generated password with:

```bash
yc lockbox payload get --id <secret_id> --key generated-password
```

Note that this example may create resources which can cost money. Run
`terraform destroy` when you don't need these resources.
