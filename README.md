# Yandex Cloud Lockbox Terraform module

Terraform module which creates Yandex Cloud Lockbox resources.

## Examples

Examples codified under
the [`examples`](https://github.com/terraform-yacloud-modules/terraform-yandex-lockbox/tree/main/examples) are intended
to give users references for how to use the module(s) as well as testing/validating changes to the source code of the
module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow
maintainers to test your changes and to keep the examples up to date for users. Thank you!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_lockbox_secret.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lockbox_secret) | resource |
| [yandex_lockbox_secret_version.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lockbox_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether the lockbox secret is protected from deletion | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Lockbox secret description | `string` | `""` | no |
| <a name="input_entries"></a> [entries](#input\_entries) | List of secret entries | `map(string)` | `{}` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder ID | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key used to encrypt the lockbox secret | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of labels | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Lockbox secret name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Lockbox secret ID |
| <a name="output_name"></a> [name](#output\_name) | Lockbox secret name |
| <a name="output_version_id"></a> [version\_id](#output\_version\_id) | Lockbox version id |
<!-- END_TF_DOCS -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-lockbox/blob/main/LICENSE).
