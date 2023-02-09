resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  subnet {
    count          = length(var.subnets)
    name           = var.subnets[count.index].name
    address_prefix = [var.subnets[count.index].address_prefix]
  }

  tags = var.tags
}
