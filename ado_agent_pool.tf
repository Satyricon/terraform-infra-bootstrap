resource "azuredevops_agent_pool" "main" {
  name           = var.azure_dev_ops_agent_pool_name
  auto_provision = false
}
