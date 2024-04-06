/*
  Description: storage account and storage resources
*/

resource "random_id" "storage_account_name" {
  byte_length = 4
}

resource "azurerm_storage_account" "functions" {
  name                     = "sa${random_id.storage_account_name.hex}"
  resource_group_name      = local.layer_00_out.functions_resource_group_name
  location                 = local.layer_00_out.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  shared_access_key_enabled = false
}

resource "azurerm_storage_account_network_rules" "functions" {
  storage_account_id = azurerm_storage_account.functions.id

  default_action = "Deny"
  ip_rules       = flatten([["71.162.200.64"], local.layer_01_out.canadaeast_ip_list])
  bypass         = ["AzureServices"]
}
