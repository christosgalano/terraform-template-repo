terraform {
  required_version = ">= 1.10, < 2.0"
}

# Placeholder so the template plans, tests and applies without a provider or
# credentials. Replace it with real resources.
resource "terraform_data" "this" {
  input = {
    name   = var.name
    labels = var.labels
  }
}
