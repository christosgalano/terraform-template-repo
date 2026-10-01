# sample_stack

Wires modules together once. Each environment calls this stack with its own values.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.10, < 2.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| sample | ../../modules/sample_module | n/a |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| name | Name prefix for the environment, e.g. acme-dev. | `string` | n/a | yes |
| labels | Labels applied to everything in the stack. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| id | ID of the sample resource. |
<!-- END_TF_DOCS -->
