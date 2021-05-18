resource "azurerm_role_assignment" "managed_identity_as_contributor" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.main.principal_id
}

resource "azurerm_role_assignment" "managed_identity_as_user_access_administrator" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "User Access Administrator"
  principal_id         = azurerm_user_assigned_identity.main.principal_id
}
