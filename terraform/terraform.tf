terraform {
  required_version = ">= 1.3.0"

  cloud {
    organization = "christosgalano"
    workspaces {
      name = "gh-terraform-library"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.42.0"
    }
  }
}
