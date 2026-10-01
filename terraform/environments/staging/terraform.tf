terraform {
  required_version = ">= 1.10, < 2.0"

  # required_providers {
  #   <provider> = {
  #     source  = "<namespace>/<provider>"
  #     version = "~> <x.y>"
  #   }
  # }

  # Remote state is required for CD: the apply job runs on a fresh runner. Set
  # the shared settings (bucket, container, ...) in the TF_BACKEND_CONFIG
  # repository variable and keep only the per-environment key here.
  #
  # backend "<type>" {
  #   key = "staging/terraform.tfstate"
  # }
}

# provider "<name>" {
#   # Fail fast if credentials point at the wrong account or subscription.
#   # Default tags or labels from var.project, var.environment and var.owner
#   # are what policy/terraform/common/tags checks.
# }
