output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Resource ID of the virtual network"
}

output "subnets_ids" {
  value = {
    for k, v in azurerm_subnet.subnets : v.name => v.id
  }
  description = "IDs of the subnets"
}
