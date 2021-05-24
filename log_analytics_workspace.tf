resource "azurerm_log_analytics_workspace" "main" {
  name                = "${var.prefix}-${var.project_name}-ws"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "pergb2018"
  retention_in_days   = 30
  tags                = var.resource_tags
}

