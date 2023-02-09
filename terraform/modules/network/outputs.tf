output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Resource ID of the virtual network"
}

output "subnets_ids" {
  value = tomap({
    for snet in azurerm_subnet.subnets : snet.name => snet.id
  })
  description = "IDs of the subnets"
}
