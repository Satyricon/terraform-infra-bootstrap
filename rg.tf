resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}${var.project_name}"
  location = var.location

  tags = var.resource_tags
}
