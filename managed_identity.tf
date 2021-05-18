resource "azurerm_user_assigned_identity" "main" {
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  name = "${var.prefix}${var.project_name}-msi"

  tags = var.resource_tags
}
