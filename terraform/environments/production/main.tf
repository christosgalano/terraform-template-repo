locals {
  suffix = "${var.workload}-${var.environment}-${var.location_abbreviation}"
  default_tags = {
    workload    = var.workload
    environment = var.environment
  }
}

locals {
  suffix_clean = replace(local.suffix, "-", "")
  rg_tags      = merge(var.rg_tags, local.default_tags)
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.suffix}"
  location = var.location
  tags     = local.rg_tags

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
}

resource "azurerm_user_assigned_identity" "identity" {
  name                = "id-${local.suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = {}
}

resource "azurerm_role_assignment" "contributor_ra" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}

module "network" {
  source              = "../../modules/network"
  name                = "vnet-${local.suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/23"]
  subnets = {
    "snet-${local.suffix}-01" = "10.0.0.0/25",
    "snet-${local.suffix}-02" = "10.0.0.128/25"
    "snet-${local.suffix}-03" = "10.0.1.0/24"
  }
  private_endpoint_network_policies_enabled = true
}
