/*
  Description: Scoped roles and permissions
*/

# storage account data access for functions
resource "azurerm_role_assignment" "assign_functions_identity_storage_blob_data_contributor" {
  scope                = azurerm_storage_account.mhdltfunctest.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.layer_01_out.functions_identity_principal_id
}

