provider "azurerm" {
  use_oidc = true

  client_id       = var.client_id
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  features {}
}
