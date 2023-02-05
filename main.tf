terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.14.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  suffix       = replace(var.project_id, "-", "")
  suffix_clean = replace(suffix, "-", "")
}

