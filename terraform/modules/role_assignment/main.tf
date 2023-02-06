resource "azurerm_role_assignment" "ra" {
  scope              = var.scope
  role_definition_id = var.role_definition_id
  principal_id       = var.principal_id
}
