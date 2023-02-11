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

module "resource_group" {
  source   = "../../modules/resource_group"
  name     = "rg-${local.suffix}"
  location = var.location
  tags     = local.rg_tags
}

module "identity" {
  source              = "../../modules/identity"
  name                = "id-${local.suffix}"
  location            = var.location
  resource_group_name = module.resource_group.name
}

module "role_assignment" {
  source               = "../../modules/role_assignment"
  scope                = module.resource_group.id
  role_definition_name = "Contributor"
  principal_id         = module.identity.principal_id
}

module "network" {
  source              = "../../modules/network"
  name                = "vnet-${local.suffix}"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.0.0.0/24"]
  subnets = {
    "snet-${local.suffix}-01" = "10.0.0.0/25",
    "snet-${local.suffix}-02" = "10.0.0.128/25"
  }
}
