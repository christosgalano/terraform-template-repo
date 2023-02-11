terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  features {}
}

module "network" {
  source              = "../"
  name                = "vnet-demo"
  location            = "westeurope"
  resource_group_name = "rg-demo"
  address_space       = ["10.0.0.0/24"]
  subnets = {
    "snet-demo-01" = "10.0.0.0/25",
    "snet-demo-02" = "10.0.0.128/25",
  }
}
