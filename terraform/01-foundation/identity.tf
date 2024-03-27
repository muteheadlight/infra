/*
  Description: Managed identities
*/

resource "azurerm_user_assigned_identity" "functions" {
  name                = "functions-managed-identity"
  location            = local.layer_00_out.region
  resource_group_name = local.layer_00_out.functions_resource_group_name
}
