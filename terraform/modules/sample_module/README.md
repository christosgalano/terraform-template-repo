# sample_module

A single-purpose module. Replace it with your own; keep the shape: typed and validated inputs, documented outputs, and a `tests/` folder.

```hcl
module "example" {
  source = "../../modules/sample_module"

  name = "acme-dev"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.10, < 2.0 |

## Providers

| Name | Version |
| ---- | ------- |
| terraform | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [terraform_data.this](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| name | Resource name. | `string` | n/a | yes |
| labels | Labels attached to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| id | Resource ID. |
| name | Resource name. |
<!-- END_TF_DOCS -->
