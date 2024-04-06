/*
  Description: log analytics and diagnostics
*/

resource "azurerm_log_analytics_workspace" "east_us" {
  count               = var.enable_analytics ? 1 : 0
  name                = "logworkspace-eastus"
  location            = local.layer_00_out.region
  resource_group_name = local.layer_00_out.logging_resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
