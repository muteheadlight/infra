/*
  Description: outputs for use in higher layers
*/

output "keyvault_id" {
  value = azurerm_key_vault.fch.id
}
