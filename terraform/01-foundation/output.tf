/*
  Description: outputs for use in higher layers
*/

output "functions_identity" {
  value = azurerm_user_assigned_identity.functions
}
output "analytics_workspace_id" {
  value = length(azurerm_log_analytics_workspace.east_us) > 0 ? azurerm_log_analytics_workspace.east_us[0].id : null
}
output "canadaeast_ip_list" {
  value = local.canadaeast_ip_lists
}
output "eventgrid_ip_list" {
  value = local.canadaeast_ip_lists
}
