output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Resource ID of the virtual network"
}

output "subnet_ids" {
  value = map({
    for snet in azurerm_virtual_network.vnet.subnets : snet.name => snet.id
  })
  description = "IDs of the subnets"
}
