/*
  Description: app insights
  */


resource "azurerm_application_insights" "gc_func" {
  count = var.enable_insights ? 1 : 0

  name                = "appinsights-garminconnect"
  location            = local.layer_00_out.region
  resource_group_name = local.layer_00_out.logging_resource_group_name
  workspace_id        = local.layer_01_out.analytics_workspace_id
  application_type    = "web"

  sampling_percentage = 0
}
