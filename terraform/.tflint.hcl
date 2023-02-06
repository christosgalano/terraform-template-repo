### Configuration ###

config {
  format = "sarif" # default, json, checkstyle, junit, compact, sarif
  module = true
  force = false
  disabled_by_default = false
}

### Terraform ###

## Plugin ##
plugin "terraform" {
  enabled = true
  preset  = "all"
}

## Rules ##
# Enforce naming conventions
rule "terraform_naming_convention" {
  enabled = true
  
  variable {
    format = "snake_case"
  }
  
  locals {
    format = "snake_case"
  }
  
  output {
    format = "snake_case"
  }
  
  resource {
    format = "snake_case"
  }
  
  module {
    format = "snake_case"
  }
  
  data {
    format = "snake_case"
  }
}

### Azure ###

## Plugin ##
plugin "azurerm" {
  enabled = true
  version = "0.20.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

## Rules ##
