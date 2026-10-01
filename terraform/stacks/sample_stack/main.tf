terraform {
  required_version = ">= 1.10, < 2.0"
}

# A stack wires modules together once. Environments call it with their own
# values, so adding an environment never means copying wiring.
module "sample" {
  source = "../../modules/sample_module"

  name   = var.name
  labels = var.labels
}
