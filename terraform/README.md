## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| azurerm | >= 3.42.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Name of the workload's environment | `string` | n/a | yes |
| location | Azure region used for the deployment of all resources | `string` | n/a | yes |
| location\_abbreviation | Abbreviation of the location | `string` | n/a | yes |
| rg\_tags | Tags to be applied on the resource groups | `map(string)` | `{}` | no |
| workload | Name of the workload that will be deployed | `string` | n/a | yes |

## Outputs

No output.
