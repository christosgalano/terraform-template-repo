terraform {
  required_version = ">= 1.3.0"

  cloud {
    organization = var.organization
    workspaces {
      name = var.workspace
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.42.0"
    }
  }
}
