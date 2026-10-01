# staging

Root module for the staging environment: backend, provider and one call to the sample stack. Values live in `staging.auto.tfvars`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.10, < 2.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| sample | ../../stacks/sample_stack | n/a |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| environment | Environment name. | `string` | n/a | yes |
| owner | Team that owns the environment. | `string` | n/a | yes |
| project | Project name, used in resource names and labels. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| id | ID of the sample resource. |
<!-- END_TF_DOCS -->
