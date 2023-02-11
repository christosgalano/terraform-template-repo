<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
   source = "<module-path>"

  # Required variables
   address_space = 
   location = 
   name = 
   resource_group_name = 
   subnets = 

   # Optional variables
   tags = {}
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | List of the virtual network's address spaces | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the virtual network | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the virtual network | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the virtual network will reside. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets that the virtual network will contain, format: 'subnet\_name' = 'subnet\_address\_prefix' | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied on the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of the virtual network |
| <a name="output_subnets_ids"></a> [subnets\_ids](#output\_subnets\_ids) | IDs of the subnets |

<!-- END_TF_DOCS --> false <!-- BEGIN_TF_DOCS --> <!-- END_TF_DOCS -->} {false } {true required} {true true true true true false false 2 true true true true true} /github/workspace/terraform/modules/network}

## Requirements

No requirements.

## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
   source = "<module-path>"

  # Required variables
   address_space = 
   location = 
   name = 
   resource_group_name = 
   subnets = 

   # Optional variables
   tags = {}
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | List of the virtual network's address spaces | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the virtual network | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the virtual network | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the virtual network will reside. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets that the virtual network will contain, format: 'subnet\_name' = 'subnet\_address\_prefix' | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied on the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of the virtual network |
| <a name="output_subnets_ids"></a> [subnets\_ids](#output\_subnets\_ids) | IDs of the subnets |
<!-- END_TF_DOCS --> false <!-- BEGIN_TF_DOCS --> <!-- END_TF_DOCS -->} {false } {true required} {true true true true true false false 2 true true true true true} /github/workspace/terraform/modules/network}

## Requirements

No requirements.

## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
   source = "<module-path>"

  # Required variables
   address_space = 
   location = 
   name = 
   resource_group_name = 
   subnets = 

   # Optional variables
   tags = {}
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | List of the virtual network's address spaces | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the virtual network | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the virtual network | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the virtual network will reside. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets that the virtual network will contain, format: 'subnet\_name' = 'subnet\_address\_prefix' | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied on the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource ID of the virtual network |
| <a name="output_subnets_ids"></a> [subnets\_ids](#output\_subnets\_ids) | IDs of the subnets |
<!-- END_TF_DOCS -->