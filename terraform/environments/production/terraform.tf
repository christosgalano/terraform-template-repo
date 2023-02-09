terraform {
  required_version = "~> 1.3"

  cloud {
    organization = "christosgalano"
    workspaces {
      name = "gh-terraform-library-production"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.42"
    }
  }
}

provider "azurerm" {
  use_oidc = true

  client_id       = var.client_id
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  features {}
}
