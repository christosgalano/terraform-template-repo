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
<!-- END_TF_DOCS --> false <!-- BEGIN_TF_DOCS --> <!-- END_TF_DOCS -->} {false } {true required} {true true true true true false false 2 true true true true true} /github/workspace/terraform/modules/private_keyvault/validate}

## Requirements

No requirements.

## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
   source = "<module-path>"
}
```

## Providers

No providers.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->