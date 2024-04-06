/*
  Description: Azure Function Apps
*/

resource "azurerm_service_plan" "canada_east" {
  name                = "asp-canada-east"
  resource_group_name = local.layer_00_out.functions_resource_group_name
  location            = var.region
  os_type             = "Linux"
  sku_name            = "Y1"
}

locals {
  function_names = toset([
    "func",
    "gc"
  ])
}

resource "random_id" "fucntion_name" {
  for_each = local.function_names

  byte_length = 4
}

resource "azurerm_linux_function_app" "fch_function" {
  for_each = local.function_names

  name                = "fa-${random_id.fucntion_name[each.key].hex}-${each.key}"
  resource_group_name = local.layer_00_out.functions_resource_group_name
  location            = var.region

  storage_account_name          = azurerm_storage_account.functions.name
  storage_uses_managed_identity = true

  service_plan_id = azurerm_service_plan.canada_east.id

  site_config {
    application_insights_key               = length(azurerm_application_insights.gc_func) > 0 ? azurerm_application_insights.gc_func[0].instrumentation_key : null
    application_insights_connection_string = length(azurerm_application_insights.gc_func) > 0 ? azurerm_application_insights.gc_func[0].connection_string : null

    application_stack {
      python_version = "3.11"
    }

    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = toset(local.layer_01_out.eventgrid_ip_list)
      iterator = it
      content {
        priority   = index(local.layer_01_out.eventgrid_ip_list, it.key) + 200
        action     = "Allow"
        ip_address = it.key
      }
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"                     = "https://${azurerm_storage_account.functions.name}.blob.core.windows.net/functions-packages/${each.key}.zip"
    "WEBSITE_RUN_FROM_PACKAGE_BLOB_MI_RESOURCE_ID" = local.layer_01_out.functions_identity.id
    "AzureWebJobsStorage__credential"              = "managedidentity"
    "AzureWebJobsStorage__clientId"                = local.layer_01_out.functions_identity.client_id

  }

  https_only = true

  identity {
    type         = "UserAssigned"
    identity_ids = [local.layer_01_out.functions_identity.id]
  }
}
