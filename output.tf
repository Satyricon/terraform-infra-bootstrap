output "storage_account_resource_group" {
  value       = azurerm_resource_group.main.name
  description = "Resource Group name where storage account is located"
}

output "storage_account_name" {
  value       = azurerm_storage_account.main.name
  description = "Storage account name"
}

output "storage_account_state_container_name" {
  value       = azurerm_storage_container.main.name
  description = "Storage account container name"
}

output "tenant_id" {
  value       = data.azurerm_subscription.current.tenant_id
  description = "Tenant ID"
}

output "subscription_id" {
  value       = data.azurerm_subscription.current.subscription_id
  description = "Subscription ID"
}

output "user_assigned_managed_identity_object_id" {
  value = azurerm_user_assigned_identity.main.principal_id
}

output "terraform_subnet_id" {
  value = azurerm_subnet.main.id
}

output "pool_name" {
  value = var.azure_dev_ops_agent_pool_name
}
