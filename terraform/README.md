<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ./modules/resource_group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Client id of the service principal used for deployment with OIDC | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the workload's environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region used for the deployment of all resources | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | Abbreviation of the location | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Terraform Cloud organization | `string` | `"christosgalano"` | no |
| <a name="input_rg_tags"></a> [rg\_tags](#input\_rg\_tags) | Tags to be applied on the resource groups | `map(string)` | `{}` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription id of the service principal used for deployment with OIDC | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant id of the service principal used for deployment with OIDC | `string` | n/a | yes |
| <a name="input_workload"></a> [workload](#input\_workload) | Name of the workload that will be deployed | `string` | n/a | yes |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | Terraform Cloud workspace | `string` | `"terraform-library"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->