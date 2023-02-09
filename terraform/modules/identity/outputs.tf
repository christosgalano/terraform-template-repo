output "resource_id" {
  value       = azurerm_user_assigned_identity.identity.id
  description = "Resource ID of the user-assigned managed identity"
}

output "principal_id" {
  value       = azurerm_user_assigned_identity.identity.principal_id
  description = "Service Principal ID of the user-assigned managed identity"
}

output "client_id" {
  value       = azurerm_user_assigned_identity.identity.client_id
  description = "Client ID of the user-assigned managed identity"

}

output "tenant_id" {
  value       = azurerm_user_assigned_identity.identity.tenant_id
  description = "Tenant ID of the user-assigned managed identity"
}
