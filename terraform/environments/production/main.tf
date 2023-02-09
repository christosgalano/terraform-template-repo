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
  role_definition_name = "Reader"
  principal_id         = module.identity.principal_id
}
