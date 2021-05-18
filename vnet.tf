resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}${var.project_name}-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = var.resource_tags
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}${var.project_name}-vnet"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/24"]

  tags = var.resource_tags
}

resource "azurerm_subnet" "main" {
  name                 = "${var.prefix}${var.project_name}-sn"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.AzureCosmosDB", "Microsoft.AzureActiveDirectory"]
}

resource "azurerm_subnet_network_security_group_association" "main_sn_nsg" {
  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}
