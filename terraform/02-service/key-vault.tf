/*
  Description: key vault
  */

resource "azurerm_key_vault" "fch" {
  name                = "kv-fch"
  location            = local.layer_00_out.region
  resource_group_name = local.layer_00_out.services_resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  enable_rbac_authorization  = true
  soft_delete_retention_days = 7

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

}
