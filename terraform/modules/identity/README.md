## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| identity\_location | Location of the user-assigned managed identity | `string` | n/a | yes |
| identity\_name | Name of the user-assigned managed identity | `string` | n/a | yes |
| resource\_group\_name | Name of the resource group where the user-assigned managed identity will reside | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| client\_id | Client ID associated with the user-assigned managed identity |
| principal\_id | Service Principal ID associated with the user-assigned managed identity |
| resource\_id | Resource ID associated with the user-assigned managed identity |
| tenant\_id | Tenant ID associated with the user-assigned managed identity |
