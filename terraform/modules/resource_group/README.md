## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | Location of the resource group | `string` | n/a | yes |
| name | Name of the resource group | `string` | n/a | yes |
| tags | Tags to be applied on the resource group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the resource group |
| location | Location of the resource group |
| name | Name of the resource group |
