/*
  Description: resource groups
*/

resource "azurerm_resource_group" "backbone" {
  name     = "rg-fit-clearing-house"
  location = var.location
}

resource "azurerm_resource_group" "functions" {
  name     = "function-dev"
  location = var.location
}
