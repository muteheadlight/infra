/*
  Description: Scoped roles and permissions
*/

# data grid sending for functions
resource "azurerm_role_assignment" "assign_functions_event_grid_data_sender" {
  scope                = azurerm_eventgrid_domain.fch.id
  role_definition_name = "EventGrid Data Sender"
  principal_id         = local.layer_01_out.functions_identity.principal_id
}

# secret r/w for functions
resource "azurerm_role_assignment" "assign_functions_key_vault_secrets_rw" {
  scope                = azurerm_key_vault.fch.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = local.layer_01_out.functions_identity.principal_id
}
