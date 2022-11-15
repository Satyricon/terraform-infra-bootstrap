resource "azurerm_storage_account" "main" {
  name                      = "${replace("${var.prefix}${var.project_name}", "-", "")}sa"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = "true"

  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    ip_rules                   = [chomp(data.http.myip.response_body)]
    virtual_network_subnet_ids = [azurerm_subnet.main.id]
  }

  tags = var.resource_tags
}

resource "azurerm_storage_container" "main" {
  name                  = "tf-state"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
