/*
  Description: outputs for use in higher layers
*/

output "region" {
  value = var.location
}
output "services_resource_group_name" {
  value = azurerm_resource_group.backbone.name
}
output "functions_resource_group_name" {
  value = azurerm_resource_group.functions.name
}
output "logging_resource_group_name" {
  value = azurerm_resource_group.logging.name
}
