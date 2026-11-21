# Yandex Cloud Lockbox Terraform module

This example creates a secret with text entries and command-generated entries.
It does not set `password_payload_specification`: the provider ignores payload
entries for secrets with a payload specification. See
[`examples/password-payload-specification`](../password-payload-specification)
for a generated-password secret.

## Usage

To run this example you need to execute:

```bash
export YC_FOLDER_ID='folder_id'
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.
