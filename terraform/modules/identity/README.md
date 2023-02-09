<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location of the user-assigned managed identity | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the user-assigned managed identity | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the user-assigned managed identity will reside | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied on the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | Client ID of the user-assigned managed identity |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | Service Principal ID of the user-assigned managed identity |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | Resource ID of the user-assigned managed identity |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | Tenant ID of the user-assigned managed identity |
<!-- END_TF_DOCS -->