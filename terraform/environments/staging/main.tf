# The environment root is configuration only: backend, provider and one call to
# the stack. Anything that is not a per-environment value belongs in the stack.

module "sample" {
  source = "../../stacks/sample_stack"

  name = "${var.project}-${var.environment}"

  labels = {
    project     = var.project
    environment = var.environment
    owner       = var.owner
  }
}
