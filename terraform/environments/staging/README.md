<!-- BEGIN_TF_DOCS -->
{/github/workspace/terraform/.terraform-docs.yaml markdown table >= 0.13.0 main.tf  {false modules} {{ .Config }}

{{ .Requirements }}

## Usage
Basic usage of this module is as follows:
```hcl
  module "example" {
    {{"  "}} source = "<module-path>"
    {{- if .Module.RequiredInputs }}
    {{"\n "}} # Required variables
    {{- range .Module.RequiredInputs }}
    {{"  "}} {{ .Name }} = {{ .GetValue }}
    {{- end }}
    {{- end }}
    {{- if .Module.OptionalInputs }}
    {{"\n "}}  # Optional variables
    {{- range .Module.OptionalInputs }}
    {{"  "}} {{ .Name }} = {{ .GetValue | printf "%s" }}
    {{- end }}
    {{- end }}
  }
```

{{ .Providers }}

{{ .Resources }}

{{ .Inputs }}

{{ .Outputs }} {[] [] true true false true true true true true true} {README.md inject <!-- BEGIN_TF_DOCS -->
{{ .Content }}
<!-- END_TF_DOCS --> false <!-- BEGIN_TF_DOCS --> <!-- END_TF_DOCS -->} {false } {true required} {true true true true true false false 2 true true true true true} /github/workspace/terraform/environments/staging}

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.42 |

## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
   source = "<module-path>"

  # Required variables
   client_id = 
   environment = 
   location = 
   location_abbreviation = 
   subscription_id = 
   tenant_id = 
   workload = 

   # Optional variables
   rg_tags = {}
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.42 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.contributor_ra](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Client id of the service principal used for deployment with OIDC | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the workload's environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region used for the deployment of all resources | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | Abbreviation of the location | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription id of the service principal used for deployment with OIDC | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant id of the service principal used for deployment with OIDC | `string` | n/a | yes |
| <a name="input_workload"></a> [workload](#input\_workload) | Name of the workload that will be deployed | `string` | n/a | yes |
| <a name="input_rg_tags"></a> [rg\_tags](#input\_rg\_tags) | Tags to be applied on the resource groups | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->