config {
  call_module_type = "local"
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Add the ruleset for your provider, then keep the version pinned.
#
# plugin "aws" {
#   enabled = true
#   version = "0.49.0"
#   source  = "github.com/terraform-linters/tflint-ruleset-aws"
# }
#
# plugin "azurerm" {
#   enabled = true
#   version = "0.32.0"
#   source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
# }
#
# plugin "google" {
#   enabled = true
#   version = "0.40.0"
#   source  = "github.com/terraform-linters/tflint-ruleset-google"
# }
