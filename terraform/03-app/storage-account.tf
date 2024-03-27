/*
  Description: storage account and storage resources
*/

resource "azurerm_storage_account" "mhdltfunctest" {
  name                     = "mhdltfunctest"
  resource_group_name      = local.layer_00_out.functions_resource_group_name
  location                 = local.layer_00_out.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  shared_access_key_enabled = false

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}