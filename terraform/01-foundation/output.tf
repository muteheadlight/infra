/*
  Description: outputs for use in higher layers
*/

output "functions_identity_id" {
  value = azurerm_user_assigned_identity.functions.id
}
output "functions_identity_principal_id" {
  value = azurerm_user_assigned_identity.functions.principal_id
}
output "analytics_workspace_id" {
  value = length(azurerm_log_analytics_workspace.east_us) > 0 ? azurerm_log_analytics_workspace.east_us[0].id : null
}
