output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Resource ID of the virtual network"
}

output "subnets_ids" {
  value = tomap({
    "${azurerm_subnet.subnets.*.name}" = azurerm_subnet.subnets.*.id
  })
  description = "IDs of the subnets"
}
