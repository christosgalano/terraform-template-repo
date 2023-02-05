resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = var.tags

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
}
